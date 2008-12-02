<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on December 1, 2008 at 6:11:01 pm</time-stamp>


<class>
<name>OxenDeathEvent</name>
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
<class-id>OregonTrail.OxenDeathEvent class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="for:value:">for: aWagon value: aValue
	|newEvent|
	newEvent := OxenDeathEvent new.
	newEvent wagon: aWagon.
	newEvent value: aValue.
	^newEvent</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.OxenDeathEvent</class-id>
<body>event generated for oxen to die</body>
</comment>

<methods>
<class-id>OregonTrail.OxenDeathEvent</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="OregonTrail" selector="run">run
	" *** This method was defined by OregonTrail.Event as a subclass responsibility.
	Replace its body with a proper implementation. *** "
	"lose one oxen"
	|oxen rand|
	GameData instance profession can_heal_oxen ifTrue:[
		rand := Random new.
		(rand next * 2) truncated = 0 ifTrue:[^false].
	].
	oxen:=wagon inventory at: 'Oxen'.
	oxen quantity: oxen quantity - 1.
	^true.</body>
</methods>

</st-source>
