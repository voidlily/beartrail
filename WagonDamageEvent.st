<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on November 9, 2008 at 6:27:20 pm</time-stamp>


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
	|rand|
	rand := Random new.
	GameData instance profession = #Carpenter ifTrue:[(rand next * 2 + 1) truncated = 1 ifTrue:[^false]]. "only 50% chance of this happening to carpenter"
	value = 1 ifTrue:[ "how to lose the game from here?"
	(wagon at: 'Wheel') &lt; 1 ifFalse:[wagon at: 'Wheel' put: ((wagon at: 'Wheel') - 1)]
	].
	value = 2 ifTrue:[
	(wagon at: 'Axle') &lt; 1 ifFalse:[wagon at: 'Axle' put: ((wagon at: 'Axle') - 1)]
	].
	value = 3 ifTrue:[
	(wagon at: 'Tongue') &lt; 1 ifFalse:[wagon at: 'Tongue' put: ((wagon at: 'Tongue') - 1)]
	].
	^true</body>
</methods>

</st-source>
