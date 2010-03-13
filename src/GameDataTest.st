<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on December 1, 2008 at 6:17:32 pm</time-stamp>


<class>
<name>GameDataTest</name>
<environment>OregonTrail</environment>
<super>XProgramming.SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.GameDataTest class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.GameDataTest</class-id>
<body>This test class tests the save and populate methods contained within GameData.

</body>
</comment>

<methods>
<class-id>OregonTrail.GameDataTest</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>OregonTrail.GameDataTest</class-id> <category>testing</category>

<body package="OregonTrail" selector="testDiscard">testDiscard
    "Tests the discard method."

    GameData populate: 1.
    GameData discard.
    
    self assert: (GameData instance gameWon = nil) &amp; (GameData instance gameEnd = nil).</body>

<body package="OregonTrail" selector="testNextDay">testNextDay
    "Tests the nextDay method."

    GameData populate: 1.
    GameData instance nextDay.
    
    self assert: ((GameData instance currentDate printString) spellAgainst: 'May 2, 1848') = 100.
    GameData discard.</body>

<body package="OregonTrail" selector="testPopulate">testPopulate
    "Tests the populate method."

    GameData populate: 1.

    self deny: GameData instance gameEnd = 1.
    self deny: GameData instance gameWon = 1.
    self assert: ((GameData instance currentDate printString) spellAgainst: 'May 1, 1848') = 100.
    self assert:GameData instance lastLocation = 1.
    self assert: GameData instance milesTraveled = 0.
    self assert: GameData instance profession name = 'Carpenter'.
    self assert: GameData instance route = #normal.
    self assert: GameData instance turnsTaken = 0.
    self deny: GameData instance wagon = nil.
    self assert: GameData instance wagon_id = 1.

    GameData discard.</body>
</methods>

</st-source>
