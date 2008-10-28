<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on October 27, 2008 at 9:42:16 pm</time-stamp>


<class>
<name>Wagon</name>
<environment>OregonTrail</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>people items distTravelled pace ration inventory no_move_turns </inst-vars>
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

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>

<body package="OregonTrail" selector="populate:">populate: wagon_id

	| conn sess ans result result2 result3 result4 wagon people inventory |
	wagon := Wagon new.
	inventory := Dictionary new.
	people := OrderedCollection new.
	conn := DBInfo connection.
	[conn connect.
	sess := conn getSession.
	sess prepare: 'SELECT people_id, wagon_pace, ration, no_move_turns from wagons where wagon_id = "', wagon_id, '";'.
	sess bindInput: (Array with: 'SELECT').
	sess execute.
	ans := sess answer.
	[ans = #noMoreAnswers] whileFalse:
	     [ans = #noAnswerStream ifFalse: [result := ans upToEnd].
	     ans := sess answer].

	result isEmpty ifFalse: [
		sess prepare: 'SELECT leader_id, person_2_id, person_3_id, person_4_id, person_5_id from people where people_id = "', ((result at: 1) at: 1) printString, '";'.
		sess bindInput: (Array with: 'SELECT').
		sess execute.
		ans := sess answer.
		[ans = #noMoreAnswers] whileFalse:
		     [ans = #noAnswerStream ifFalse: [result2 := ans upToEnd].
		     ans := sess answer]].

	sess prepare: 'SELECT item_id, item_quantity from items where wagon_id = "', wagon_id, '";'.
	sess bindInput: (Array with: 'SELECT').
	sess execute.
	ans := sess answer.
	[ans = #noMoreAnswers] whileFalse:
	     [ans = #noAnswerStream ifFalse: [result3 := ans upToEnd].
	     ans := sess answer].

	sess prepare: 'SELECT item_id, item_name from itemdata;'.
	sess bindInput: (Array with: 'SELECT').
	sess execute.
	ans := sess answer.
	[ans = #noMoreAnswers] whileFalse:
	     [ans = #noAnswerStream ifFalse: [result4 := ans upToEnd].
	     ans := sess answer]]
     ensure: [conn disconnect].

	result2 isEmpty ifFalse:
		[people add: (Person populate: (((result2 at: 1) at: 1) printString)).
		people add: (Person populate: (((result2 at: 1) at: 2) printString)).
		people add: (Person populate: (((result2 at: 1) at: 3) printString)).
		people add: (Person populate: (((result2 at: 1) at: 4) printString)).
		people add: (Person populate: (((result2 at: 1) at: 5) printString)).
		wagon people: people; pace: (((result at: 1) at: 2) printString); ration: (((result at: 1) at: 3) printString); no_move_turns: (((result at: 1) at: 4) printString)].

	result3 isEmpty ifFalse: 
		[result3 do: [:r3 | result4 do: [:r4 | (r3 at: 1) = (r4 at: 1) ifTrue: [inventory at: (r4 at: 2) put: (r3 at: 2)]]].
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
<class-id>OregonTrail.Wagon</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Edit the following to properly initialize instance variables ***"
	people := OrderedCollection new.
	items := OrderedCollection new.
	distTravelled := 0.
	pace := nil.
	ration := nil.
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
	Transcript show: 'Distance travelled = ', distTravelled printString, ' miles'. Transcript cr.
	Transcript show: 'Item Inventory'. Transcript cr.
	items do:[:item | Transcript show: item printString. Transcript cr.].
	Transcript show: 'Person Manifest'. Transcript cr.
	people do:[:person | Transcript show: person printString. Transcript cr.].
	Transcript show: 'Total Wagon Weight: ', self totalWeight printString, ' pounds'. Transcript cr.</body>

<body package="OregonTrail" selector="printString">printString
	"Example string:'A Wagon with 5 people and 12 items'"
	^('A Wagon with ', self totalPeople printString, ' people and ', items size printString, ' items')</body>
</methods>

<methods>
<class-id>OregonTrail.Wagon</class-id> <category>accessing</category>

<body package="OregonTrail" selector="distTravelled">distTravelled
	^distTravelled</body>

<body package="OregonTrail" selector="distTravelled:">distTravelled: anObject
	distTravelled := anObject</body>

<body package="OregonTrail" selector="inventory">inventory
	^inventory</body>

<body package="OregonTrail" selector="inventory:">inventory: anObject
	inventory := anObject.</body>

<body package="OregonTrail" selector="items">items
	^items</body>

<body package="OregonTrail" selector="items:">items: anObject
	items := anObject</body>

<body package="OregonTrail" selector="no_move_turns">no_move_turns
	^no_move_turns</body>

<body package="OregonTrail" selector="no_move_turns:">no_move_turns: anObject
	no_move_turns := anObject.</body>

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

<body package="OregonTrail" selector="save:">save: wagon_id
	| conn sess |
	conn := DBInfo connection.
	[conn connect.
	sess := conn getSession.
	sess prepare: 'UPDATE wagon set (wagon_pace, ration, no_move_turns) values ("', pace, '", "', ration, '", "', no_move_turns, '") where wagon_id = "', wagon_id, '";'.
	sess execute.
	sess answer.]
	     ensure: [conn disconnect].</body>

<body package="OregonTrail" selector="totalPeople">totalPeople
	^(people reject:[:person | person isDead]) size.</body>

<body package="OregonTrail" selector="totalWeight">totalWeight
	|total| total:=0.
	items do:[:item | total:=total+(item totalWeight)].
	^total</body>
</methods>

<methods>
<class-id>OregonTrail.Wagon</class-id> <category>changing</category>

<body package="OregonTrail" selector="move">move
	"Takes 1 turn. Moves the wagon according to the pace. For every not dead person, feed them."
	|alivePeople|
	pace = #slow ifTrue:[distTravelled:=distTravelled+10].
	pace = #normal ifTrue:[distTravelled:=distTravelled+20].
	pace = #grueling ifTrue:[distTravelled:=distTravelled+28].
	alivePeople := people reject:[:person | person isDead].
	alivePeople do:[:person | person eat: ration].</body>
</methods>

<methods>
<class-id>OregonTrail.Wagon</class-id> <category>adding</category>

<body package="OregonTrail" selector="addItem:">addItem: anItem
	"Adds an item to the Wagon"
	items add: anItem.
	self changed: #items.</body>

<body package="OregonTrail" selector="addPerson:">addPerson:aPerson
	"Adds a person to the Wagon"
	people add: aPerson.
	self changed: #people</body>

<body package="OregonTrail" selector="buyItem:quan:">buyItem: anItemName quan: anAmount
	"First finds if the item exists already. If it does, buy that many items. If not, add the item to the wagon as a new item then buy that many"
	|itemList newItem|
	itemList:= items select:[:item | item name = anItemName].
	itemList size=0 ifFalse:[(itemList at: 1) buy: anAmount]
				   ifTrue:[newItem := Item named: anItemName weight:1. self addItem: newItem. newItem buy: anAmount.].
	self changed: #items.</body>
</methods>

<methods>
<class-id>OregonTrail.Wagon</class-id> <category>removing</category>

<body package="OregonTrail" selector="removeItem:">removeItem: anItem
	|toRemove| toRemove := items detect:[:item | item = anItem].
	items remove: toRemove.
	self changed: #items.</body>

<body package="OregonTrail" selector="removePerson:">removePerson: aPerson
	|toRemove| toRemove := people detect:[:person | person = aPerson].
	people remove: toRemove.
	self changed: #people.</body>
</methods>

</st-source>
