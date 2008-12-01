<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on December 1, 2008 at 9:15:56 am</time-stamp>


<class>
<name>Wagon</name>
<environment>OregonTrail</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>people pace ration inventory no_move_turns maxWeight wagon_id oxenHealth oxenTiredDays </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.Wagon class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="create:">create: people_id

	| wagon result id |
	wagon := Wagon new.
	result := DBManager selectQuery: 'SELECT max(wagon_id) from wagons'.
	id := (((result at: 1) at: 1) + 1).
	DBManager inputQuery: 'INSERT into wagons (wagon_id, people_id, wagon_pace, ration, no_move_turns) VALUES (', id printString, ', ', people_id printString, ', "steady", "normal", 0);'.
	wagon wagon_id: id.

	^wagon</body>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>

<body package="OregonTrail" selector="populate:">populate: wagon_id

	| query result result2 result3 wagon people inventory |
	wagon := Wagon new.
	wagon wagon_id: wagon_id.
	inventory := Dictionary new.
	people := OrderedCollection new.
	query := 'SELECT people_id, wagon_pace, ration, no_move_turns, oxen_health, oxen_tired_days from wagons where wagon_id = "', wagon_id printString, '";'.
	result := DBManager selectQuery: query.

	result isEmpty ifFalse: [
		query := 'SELECT leader_id, person_2_id, person_3_id, person_4_id, person_5_id from people where people_id = "', ((result at: 1) at: 1) printString, '";'.
		result2 := DBManager selectQuery: query.
		wagon pace: ((result at: 1) at: 2) asSymbol; ration: ((result at: 1) at: 3) asSymbol; no_move_turns: ((result at: 1) at: 4) asNumber; oxenHealth: ((result at: 1) at: 5) asSymbol; oxenTiredDays: ((result at: 1) at: 6) asNumber].

	query := 'SELECT item_name from itemdata;'.
	result3 := DBManager selectQuery: query.

	result2 isEmpty ifFalse:
		[people add: (Person populate: (((result2 at: 1) at: 1) printString)).
		people add: (Person populate: (((result2 at: 1) at: 2) printString)).
		people add: (Person populate: (((result2 at: 1) at: 3) printString)).
		people add: (Person populate: (((result2 at: 1) at: 4) printString)).
		people add: (Person populate: (((result2 at: 1) at: 5) printString)).
		wagon people: people].

	result3 isEmpty ifFalse:
		[result3 do: [:n | inventory at: (n at: 1) put: (Item populate: (n at: 1) wagon: wagon_id)].
		wagon inventory: inventory].

	^wagon</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.Wagon</class-id>
<body>The Wagon keeps track of how far it has moved, the people on it, how well they eat, and what items they own.

Instance Variables:
	distTravelled	&lt;Integer&gt;	distance travelled
	items	&lt;OrderedCollection&gt;	list of items the wagon has
	pace	&lt;Symbol&gt;	how fast the wagon is moving (#stopped,#slow,#normal,#grueling)
	people	&lt;SortedCollection&gt;	list of people in the wagon
	ration	&lt;Symbol&gt;	current ration for the people in the wagon (#none,#adequate,#wellFed)
	inventory&lt;Dictionary&gt;
	no_move_turns&lt;Integer&gt;

</body>
</comment>

<methods>
<class-id>OregonTrail.Wagon</class-id> <category>changing</category>

<body package="OregonTrail" selector="move">move
	"Takes 1 turn. Moves the wagon according to the pace. For every not dead person, feed them.  Will           set ration to barebones if no food is left in Wagon's possession."
	|alivePeople foodEaten totalFood|
	no_move_turns&gt;0 ifFalse:[
		pace = #slow ifTrue:[self distTravelled: self distTravelled+10].
		pace = #normal ifTrue:[self distTravelled: self distTravelled+20].
		pace = #grueling ifTrue:[self oxenTiredDays: (self oxenTiredDays + 1). self distTravelled: self distTravelled+28.].
		oxenHealth=#bad ifTrue:[self distTravelled: self distTravelled - 3].
	]
	ifTrue:[no_move_turns:=no_move_turns-1].
	totalFood:=(inventory at: 'Food') quantity.
     totalFood &lt; self totalPeople ifTrue: ration=#barebones.
	ration=#barebones ifTrue:[foodEaten:=self totalPeople].
	ration=#meager ifTrue:[foodEaten:=self totalPeople * 2].
	ration=#normal ifTrue:[foodEaten:=self totalPeople * 3].
	ration=#wellfed ifTrue:[foodEaten:=self totalPeople * 4].
	(inventory at: 'Food') quantity: (totalFood - foodEaten).
     (inventory at: 'Food') quantity &lt; 0 ifTrue: [(inventory at: 'Food') quantity: 0].
	alivePeople := people reject:[:person | person isDead].
	alivePeople do:[:person | person eat: ration].
	"GameData instance nextDay."</body>

<body package="OregonTrail" selector="rest">rest
	no_move_turns :=no_move_turns + 1.
	oxenTiredDays := 0.
	self move.</body>
</methods>

<methods>
<class-id>OregonTrail.Wagon</class-id> <category>accessing</category>

<body package="OregonTrail" selector="buy:quan:at:">buy: anItem quan: anAmount at: aStore

	| money cost itemName oldQuantity |
	money := (inventory at: 'Money') quantity.
	itemName := anItem name.
	oldQuantity := (inventory at: itemName) quantity.
	cost := (aStore priceOf: anItem) * anAmount.
	(money &gt; cost) &amp; ((self totalWeight + (anItem weight * anAmount)) &lt; maxWeight) ifTrue:
		[money := money - cost.
		(inventory at: itemName) quantity: (oldQuantity + anAmount).
		(inventory at: 'Money') quantity: money.]</body>

<body package="OregonTrail" selector="distTravelled">distTravelled
	^GameData instance milesTraveled</body>

<body package="OregonTrail" selector="distTravelled:">distTravelled: anObject
	GameData instance milesTraveled: anObject</body>

<body package="OregonTrail" selector="inventory">inventory
	^inventory</body>

<body package="OregonTrail" selector="inventory:">inventory: anObject
	inventory := anObject.</body>

<body package="OregonTrail" selector="maxWeight">maxWeight
	^maxWeight</body>

<body package="OregonTrail" selector="no_move_turns">no_move_turns
	^no_move_turns</body>

<body package="OregonTrail" selector="no_move_turns:">no_move_turns: anObject
	no_move_turns := anObject.</body>

<body package="OregonTrail" selector="oxenHealth">oxenHealth
	^oxenHealth</body>

<body package="OregonTrail" selector="oxenHealth:">oxenHealth: anObject
	oxenHealth := anObject</body>

<body package="OregonTrail" selector="oxenTiredDays">oxenTiredDays
	^oxenTiredDays</body>

<body package="OregonTrail" selector="oxenTiredDays:">oxenTiredDays: anObject
	oxenTiredDays := anObject</body>

<body package="OregonTrail" selector="pace">pace
	^pace</body>

<body package="OregonTrail" selector="pace:">pace: anObject
	pace := anObject</body>

<body package="OregonTrail" selector="people">people
	^people</body>

<body package="OregonTrail" selector="people:">people: anObject
	people := anObject</body>

<body package="OregonTrail" selector="ration">ration
	^ration</body>

<body package="OregonTrail" selector="ration:">ration: anObject
	ration := anObject</body>

<body package="OregonTrail" selector="save">save
	GameData instance save.
	people do: [:p | p save].
	inventory do: [:i |	i save].
	DatabaseManager update: 'UPDATE wagons set wagon_pace = "', (pace asString), '", ration = "', (ration asString), '", no_move_turns = ', (no_move_turns printString), ' where wagon_id = ', wagon_id printString, ';'.</body>

<body package="OregonTrail" selector="totalPeople">totalPeople
	^(people reject:[:person | person isDead]) size.</body>

<body package="OregonTrail" selector="totalWeight">totalWeight
	|total| total:=0.
	inventory do:[:item | total:=total+(item totalWeight)].
	^total</body>

<body package="OregonTrail" selector="wagon_id">wagon_id
	^wagon_id</body>

<body package="OregonTrail" selector="wagon_id:">wagon_id: anObject
	wagon_id := anObject</body>
</methods>

<methods>
<class-id>OregonTrail.Wagon</class-id> <category>removing</category>

<body package="OregonTrail" selector="removePerson:">removePerson: aPerson
	|toRemove| toRemove := people detect:[:person | person = aPerson].
	people remove: toRemove.
	self changed: #people.</body>
</methods>

<methods>
<class-id>OregonTrail.Wagon</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Edit the following to properly initialize instance variables ***"
	people := OrderedCollection new.
	pace := #steady.
	ration := #normal.
	no_move_turns := 0.
	maxWeight := 3500.
	inventory := Dictionary new.
	oxenTiredDays := 0.
	oxenHealth := #good.
	" *** And replace this comment with additional initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>OregonTrail.Wagon</class-id> <category>printing</category>

<body package="OregonTrail" selector="printReport">printReport
	"Example transcript report:
	A Wagon with 2 People and 2 Items
	Pace is #normal and Rations are #meager
	Distance Travelled = 120 miles
	Item Inventory
	100 food weighing 100 pounds
	10 clothes weighing 20 pounds
	Person Manifest
	Bob #good 2 days starving
	Sally #poor 2 days starving
	Total Wagon Weight: 120 pounds"
	Transcript show: self printString. Transcript cr.
	Transcript show: 'Pace is ', pace printString, ' and Rations are ', ration printString. Transcript cr.
	Transcript show: 'Distance travelled = ', self distTravelled printString, ' miles'. Transcript cr.
	Transcript show: 'Item Inventory'. Transcript cr.
"	items do:[:item | Transcript show: item printString. Transcript cr.]."
	Transcript show: 'Person Manifest'. Transcript cr.
	people do:[:person | Transcript show: person printString. Transcript cr.].
	Transcript show: 'Total Wagon Weight: ', self totalWeight printString, ' pounds'. Transcript cr.</body>

<body package="OregonTrail" selector="printString">printString
    "Returns the number of people and the summation of the quantities of all distinct items in the wagon."
    "Example: string:'A Wagon with 5 people and 12 items'"
     |totalItems|

    totalItems := 0.
    self inventory do:[:i | totalItems := totalItems + i quantity].
	^('A Wagon with ', self totalPeople printString, ' people and ', totalItems printString, ' items')</body>
</methods>

<methods>
<class-id>OregonTrail.Wagon</class-id> <category>adding</category>

<body package="OregonTrail" selector="addPerson:">addPerson:aPerson
	"Adds a person to the Wagon"
	people add: aPerson.
	self changed: #people</body>
</methods>

</st-source>
