<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on November 30, 2008 at 1:47:11 pm</time-stamp>


<class>
<name>NoMoveEvent</name>
<environment>OregonTrail</environment>
<super>OregonTrail.Event</super>
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
<class-id>OregonTrail.NoMoveEvent class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="for:">for: aWagon
	|newEvent|
	newEvent := NoMoveEvent new.
	newEvent wagon: aWagon.
	^newEvent</body>

<body package="OregonTrail" selector="for:value:">for: aWagon value: aValue
	|newEvent|
	newEvent := NoMoveEvent new.
	newEvent wagon: aWagon.
	newEvent value: aValue.
	^newEvent</body>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.NoMoveEvent</class-id>
<body>event that causes wagon to not move</body>
</comment>

<methods>
<class-id>OregonTrail.NoMoveEvent</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="OregonTrail" selector="run">run
	|rand noMoveTurns|
	rand := Random new.
	noMoveTurns := (rand next * 3 + 1) truncated.
	wagon no_move_turns: wagon no_move_turns + noMoveTurns.
	^true</body>
</methods>

</st-source>
