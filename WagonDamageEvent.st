<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on November 25, 2008 at 12:48:22 pm</time-stamp>


<class>
<name>WagonDamageEvent</name>
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
<class-id>OregonTrail.WagonDamageEvent class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="for:value:">for: aWagon value: aValue
	|newEvent|
	newEvent := WagonDamageEvent new.
	newEvent wagon: aWagon.
	newEvent value: aValue.
	^newEvent</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.WagonDamageEvent</class-id>
<body>eventfactory changes the value to be some random part and passes that as the value to constructor - :awesome:!

also needs a way to end the game if going negative</body>
</comment>

<methods>
<class-id>OregonTrail.WagonDamageEvent</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="OregonTrail" selector="run">run
	|rand wheels axles tongues|
	rand := Random new.
	GameData instance profession = #Carpenter ifTrue:[(rand next * 2 + 1) truncated = 1 ifTrue:[^false]]. "only 50% chance of this happening to carpenter"
	wheels := wagon inventory at: 'Wheel'.
	axles := wagon inventory at: 'Axle'.
	tongues := wagon inventory at: 'Tongue'.
	value = 1 ifTrue:[ "how to lose the game from here? maybe lock pace as stopped and make game a de facto loss?"
	(wheels quantity) &lt; 1 ifFalse:[wheels quantity: (wheels quantity) - 1]
	].
	value = 2 ifTrue:[
	(axles quantity) &lt; 1 ifFalse:[axles quantity: (axles quantity) - 1]
	].
	value = 3 ifTrue:[
	(tongues quantity) &lt; 1 ifFalse:[tongues quantity: (tongues quantity) - 1]
	].
	^true</body>
</methods>

</st-source>
