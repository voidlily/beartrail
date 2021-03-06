<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on December 2, 2008 at 6:41:48 pm</time-stamp>


<class>
<name>PersonDeathEvent</name>
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
<class-id>OregonTrail.PersonDeathEvent class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="for:value:">for: aWagon value: aValue
	|newEvent|
	newEvent := PersonDeathEvent new.
	newEvent wagon: aWagon.
	newEvent value: aValue.
	^newEvent</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.PersonDeathEvent</class-id>
<body>people die if not already dead or not at good health</body>
</comment>

<methods>
<class-id>OregonTrail.PersonDeathEvent</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="OregonTrail" selector="run">run
	"random person dies that's not in good or dead health"
	|person rand people|
	rand := Random new.
	person := wagon people at: (rand next * 5 + 1) truncated.
	(people := wagon people reject: [:x | (x health = #good or: [x health = #dead])]) isEmpty ifTrue:[^nil].
	[(person health = #dead)] whileTrue:[person := (wagon people at: (rand next * (people size) + 1) truncated)].
	person health = #dead.
	wagon totalPeople=0 ifTrue:[GameData instance gameEnd:1. GameData changed: #gameEnd.].
	^'',person name,' has died.'.</body>
</methods>

</st-source>
