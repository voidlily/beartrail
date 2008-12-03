<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on December 2, 2008 at 6:41:57 pm</time-stamp>


<class>
<name>OxenTiredEvent</name>
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
<class-id>OregonTrail.OxenTiredEvent class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="for:value:">for: aWagon value: aValue
	|newEvent|
	newEvent := OxenTiredEvent new.
	newEvent wagon: aWagon.
	newEvent value: aValue.
	^newEvent</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.OxenTiredEvent</class-id>
<body>how oxen get tired:

if you go too long without resting, or too fast, oxen get tired and move more slowly</body>
</comment>

<methods>
<class-id>OregonTrail.OxenTiredEvent</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="OregonTrail" selector="run">run
	" *** This method was defined by OregonTrail.Event as a subclass responsibility.
	Replace its body with a proper implementation. *** "
	"if a farmer, 50% chance of happening - also it makes you lose 3 miles per turn"
	|rand|
	GameData instance profession can_heal_oxen ifTrue:[
		rand := Random new.
		(rand next * 2) truncated = 0 ifTrue:[^nil].
	].
	(wagon oxenTiredDays &gt;= 10) ifTrue:[wagon oxenHealth: #bad. ^'Oxen are tired.'.]
	ifFalse:[^nil].</body>
</methods>

</st-source>
