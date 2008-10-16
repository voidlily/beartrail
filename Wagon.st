<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on October 16, 2008 at 9:55:13 am</time-stamp>


<class>
<name>Wagon</name>
<environment>OregonTrail</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>people items distTravelled pace ration </inst-vars>
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

</body>
</comment>

<methods>
<class-id>OregonTrail.Wagon</class-id> <category>accessing</category>

<body package="OregonTrail" selector="distTravelled">distTravelled
	^distTravelled</body>

<body package="OregonTrail" selector="distTravelled:">distTravelled: anObject
	distTravelled := anObject</body>

<body package="OregonTrail" selector="items">items
	^items</body>

<body package="OregonTrail" selector="items:">items: anObject
	items := anObject</body>

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

<body package="OregonTrail" selector="totalPeople">totalPeople
	^(people reject:[:person | person isDead]) size.</body>

<body package="OregonTrail" selector="totalWeight">totalWeight
	|total| total:=0.
	items do:[:item | total:=total+(item totalWeight)].
	^total</body>
</methods>

<methods>
<class-id>OregonTrail.Wagon</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Edit the following to properly initialize instance variables ***"
	people := SortedCollection new.
	items := OrderedCollection new.
	distTravelled := 0.
	pace := nil.
	ration := nil.
	" *** And replace this comment with additional initialization code *** "
	people sortBlock: [:a :b | a name &lt;= b name].
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
<class-id>OregonTrail.Wagon</class-id> <category>changing</category>

<body package="OregonTrail" selector="move">move
	"Takes 1 turn. Moves the wagon according to the pace. For every not dead person, feed them."
	|alivePeople|
	pace = #slow ifTrue:[distTravelled:=distTravelled+10].
	pace = #normal ifTrue:[distTravelled:=distTravelled+20].
	pace = #grueling ifTrue:[distTravelled:=distTravelled+28].
	alivePeople := people reject:[:person | person isDead].
	alivePeople do:[:person | person eat: ration].</body>

<body package="OregonTrail" selector="sortBlock:">sortBlock: aBlock
	"Changes the sortBlock for the people SortedCollection"
	people sortBlock:aBlock.</body>
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
