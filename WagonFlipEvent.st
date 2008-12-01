<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on December 1, 2008 at 9:16:08 am</time-stamp>


<class>
<name>WagonFlipEvent</name>
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
<class-id>OregonTrail.WagonFlipEvent class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="for:value:">for: aWagon value: aValue
	|newEvent|
	newEvent := WagonFlipEvent new.
	newEvent wagon: aWagon.
	newEvent value: aValue.
	^newEvent</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.WagonFlipEvent</class-id>
<body>wagons flip in rivers - sucks for them</body>
</comment>

<methods>
<class-id>OregonTrail.WagonFlipEvent</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="OregonTrail" selector="run">run
	|rand outcome people person inventory item quantity |
	rand := Random new.
	outcome := (rand next * 2) truncated.
	outcome = 0 ifTrue:[
		people := wagon people reject: [:x | (x health = #dead)].
		person := people at: (rand next * (people size) + 1) truncated.
		person health: #dead.]
	ifFalse:[
		inventory := wagon inventory reject:[:x | x quantity = 0].
		item := (inventory asOrderedCollection) at: (rand next * (inventory size) + 1) truncated.
		quantity := 0.
		(item name = 'Wheel') ifTrue:[quantity := 1].
		(item name = 'Axle') ifTrue:[quantity := 1].
		(item name = 'Tongue') ifTrue:[quantity := 1].
		quantity=0 ifTrue:[quantity := (rand next * ((item quantity/10) truncated) + 1) truncated].
		].
	^true</body>
</methods>

</st-source>
