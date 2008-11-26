<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on November 25, 2008 at 8:24:29 pm</time-stamp>


<class>
<name>HuntingEvent</name>
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
<class-id>OregonTrail.HuntingEvent class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="for:value:">for: aWagon value: aValue
	|newEvent|
	newEvent := HuntingEvent new.
	newEvent wagon: aWagon.
	newEvent value: aValue.
	^newEvent</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.HuntingEvent</class-id>
<body>how to hunt, for oregon trail:

step 1. lose ammo (unless you're a farmer)
step 2. get food
</body>
</comment>

<methods>
<class-id>OregonTrail.HuntingEvent</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="OregonTrail" selector="run">run
	" *** This method was defined by OregonTrail.Event as a subclass responsibility.
	Replace its body with a proper implementation. *** "
	|rand food foodQuantity ammo ammoQuantity maxAmmo|
	rand := Random new.
	food := wagon inventory at: 'Food'.
	ammo := wagon inventory at: 'Ammo'.
	foodQuantity := ((rand next * 100) + 1) truncated.
	GameData instance profession=#Farmer ifFalse:[
		ammo quantity &lt; 3 ifTrue:[maxAmmo := ammo quantity] ifFalse:[maxAmmo := 3].
		ammoQuantity := ((rand next * maxAmmo) + 1) truncated.
		ammo quantity: ammo quantity - ammoQuantity.].
	food quantity: food quantity + foodQuantity.
	^true.</body>
</methods>

</st-source>
