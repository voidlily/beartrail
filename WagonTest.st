<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on December 1, 2008 at 9:16:18 am</time-stamp>


<class>
<name>WagonTest</name>
<environment>OregonTrail</environment>
<super>XProgramming.SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>wagon </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.WagonTest class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.WagonTest</class-id>
<body>test wagon

Instance Variables:
	wagon	&lt;Wagon&gt;	description of wagon

</body>
</comment>

<methods>
<class-id>OregonTrail.WagonTest</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>OregonTrail.WagonTest</class-id> <category>testing</category>

<body package="OregonTrail" selector="testAddPerson">testAddPerson
    "Tests the addPerson method."

    wagon := Wagon populate: 1.
    wagon addPerson: (Person named: 'Testy').
    self should: [wagon people do:[:p | 
        (p name sameAs: 'Testy') ifTrue:
            [^(p health = #good) and: [^p daysStarving = 0]]]].</body>

<body package="OregonTrail" selector="testBuyQuanAt">testBuyQuanAt
    "Tests the buy: quan: at: method."
    |store|

    wagon := Wagon populate: 1.
    store := Store populate: 1.

    self assert:(wagon inventory at: 'Money') quantity = 500.
    self assert:(wagon inventory at: 'Clothes') quantity = 8.
    wagon buy: (wagon inventory at: 'Clothes') quan: 2 at: store.
    self assert:(wagon inventory at: 'Money') quantity = 480.
    self assert:(wagon inventory at: 'Clothes') quantity = 10.
    self assert:(wagon inventory size) = 8.

    (wagon inventory at: 'Money') quantity: 10.
    wagon buy: (wagon inventory at: 'Tongue') quan: 2 at: store.
    self assert:(wagon inventory at: 'Money') quantity = 10.
    self assert:(wagon inventory at: 'Tongue') quantity = 3.

    (wagon inventory at: 'Money') quantity: 1000.
    wagon buy: (wagon inventory at: 'Tongue') quan: 22 at: store.
    self assert:(wagon inventory at: 'Money') quantity = 1000.
    self assert:(wagon inventory at:'Tongue') quantity = 3.

    wagon buy: (wagon inventory at: 'Tongue') quan: 2 at: store.
    self assert:(wagon inventory at: 'Money') quantity = 980.
    self assert:(wagon inventory at: 'Tongue') quantity = 5.</body>

<body package="OregonTrail" selector="testMove">testMove
    "Tests the move method."

    wagon := Wagon populate: 1.
    wagon move.
    
    self assert: wagon no_move_turns = 7.
    self assert: (wagon inventory at: 'Food') quantity = 85.

    wagon := Wagon populate: 1.
    wagon ration: #barebones.
    wagon move.

    self assert: (wagon inventory at: 'Food') quantity = 95.

    wagon := Wagon populate: 1.
    wagon ration: #meager.
    wagon move.

    self assert: (wagon inventory at: 'Food') quantity = 90.

    wagon := Wagon populate: 1.
    wagon ration: #wellfed.
    wagon move.

    self assert: (wagon inventory at: 'Food') quantity = 80.

    wagon := Wagon populate: 1.
    wagon ration: #wellfed.
    (wagon inventory at: 'Food') quantity: 15.
    wagon move.

    self assert:(wagon inventory at: 'Food') quantity = 0.

    GameData populate: 1.
    wagon := Wagon populate: 1.
    wagon no_move_turns: 0.
    wagon move.

    self assert: wagon distTravelled = 20.

    wagon pace: #slow.
    wagon move.

    self assert: wagon distTravelled = 30.

    wagon pace: #grueling.
    wagon move.

    self assert: wagon distTravelled = 58.
    self assert: wagon oxenTiredDays = 1.

    wagon oxenHealth: #bad.
    wagon move.

    self assert: wagon distTravelled = 83.
    self assert: wagon oxenTiredDays = 2.</body>

<body package="OregonTrail" selector="testPopulate">testPopulate
    "Tests the populate method."

    wagon := Wagon populate: 1.
    self assert: (wagon inventory at: 'Money') quantity = 500.
    self assert: (wagon inventory at: 'Oxen') quantity = 10.
    self assert: (wagon inventory at: 'Food') quantity = 100.
    self assert: (wagon inventory at: 'Clothes') quantity = 8.
    self assert: (wagon inventory at: 'Ammo') quantity = 200.
    self assert: (wagon inventory at: 'Wheel') quantity = 1.
    self assert: (wagon inventory at: 'Axle') quantity = 2.
    self assert: (wagon inventory at: 'Tongue') quantity = 3.
    self assert: wagon totalWeight = 1341.
    self assert: wagon maxWeight = 3500.
    self assert: wagon no_move_turns = 8.
    self assert: wagon oxenHealth = #good.
    self assert: wagon oxenTiredDays = 0.
    self assert: wagon pace = #steady.
    self assert: wagon ration = #normal.
    self should: [
        wagon people do: [:p |
            (p name sameAs: 'Bob') ifTrue: [
                ^(p health = #good) and: [^(p daysStarving = 0)]]]].
    self should: [
        wagon people do: [:p |
            (p name sameAs: 'Ann') ifTrue: [
                ^(p health = #fair) and: [^(p daysStarving = 0)]]]].
    self should: [
        wagon people do: [:p |
            (p name sameAs: 'Fred') ifTrue: [
                ^(p health = #good) and: [^(p daysStarving = 0)]]]].
    self should: [
        wagon people do: [:p |
            (p name sameAs: 'Hank') ifTrue: [
                ^(p health = #poor) and: [^(p daysStarving = 0)]]]].
    self should: [
        wagon people do: [:p |
            (p name sameAs: 'Sarah') ifTrue: [
                ^(p health = #good) and: [^(p daysStarving = 0)]]]].
    self assert: wagon totalPeople = 5.
    self assert: wagon wagon_id = 1.</body>

<body package="OregonTrail" selector="testPrintReport">testPrintReport
    "Tests the printReport method."

    "TO DO."</body>

<body package="OregonTrail" selector="testPrintString">testPrintString
    "Tests the printString method."

    wagon := Wagon populate: 1.
    self assert: (wagon printString spellAgainst: 'A Wagon with 5 people and 824 items') = 100.</body>

<body package="OregonTrail" selector="testRemovePerson">testRemovePerson
    "Tests the removePerson method."

    |oldPeople|
    wagon := Wagon populate: 1.
    oldPeople := wagon totalPeople.
    self deny: oldPeople = 0.
    wagon removePerson: (wagon people at: 1).
    self assert: wagon totalPeople = (oldPeople - 1).</body>

<body package="OregonTrail" selector="testRest">testRest
    "Tests the rest method."

    wagon := Wagon populate: 1.
    wagon oxenTiredDays: 1.
    wagon no_move_turns: 1.

    wagon rest.

    self assert: wagon oxenTiredDays = 0.
    self assert: wagon no_move_turns = 1.</body>

<body package="OregonTrail" selector="testTotalPeople">testTotalPeople
    "Tests the totalPeople method."

    wagon := Wagon populate: 1.
    self assert: wagon totalPeople = 5.</body>

<body package="OregonTrail" selector="testTotalWeight">testTotalWeight
    "Tests the totalWeight method."

    wagon := Wagon populate: 1.
    self assert: wagon totalWeight = 1341.</body>
</methods>

</st-source>
