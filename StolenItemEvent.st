<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on November 25, 2008 at 12:47:57 pm</time-stamp>


<class>
<name>StolenItemEvent</name>
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
<class-id>OregonTrail.StolenItemEvent class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="for:value:">for: aWagon value: aValue
	|newEvent|
	newEvent := StolenItemEvent new.
	newEvent wagon: aWagon.
	newEvent value: aValue.
	^newEvent</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.StolenItemEvent</class-id>
<body>stupid UGA grads get off my lawn

</body>
</comment>

<methods>
<class-id>OregonTrail.StolenItemEvent</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="OregonTrail" selector="run">run
    "Picks a random item from the wagon's inventory and, if it is not a Wheel, an Axle, or a Tongue, steals a random quantity of that item that can
     be up to one-tenth of the currenty quantity but at least one.  Only one Wheel, Axle, or Tongue is stolen if one is picked as the item to be stolen."
	|rand keys key item quantity count selectionIndex|
	rand := Random new.
	keys := wagon inventory keys.
     count := 0.
     selectionIndex := ((rand next) * (keys size) + 1) truncated.
     keys do:[:k | 
                   (count := count + 1).
                   (count = selectionIndex) ifTrue: [key := k]].
	item := wagon inventory at: key.
     Transcript show: item printString.
	(item quantity = 0) ifTrue:[^false].
	quantity := 0.
	(item name = 'Wheel') ifTrue:[quantity := 1].
	(item name = 'Axle') ifTrue:[quantity := 1].
	(item name = 'Tongue') ifTrue:[quantity := 1].
	
	quantity=0 ifTrue:[quantity := (rand next * ((item quantity/10) truncated) + 1) truncated].
	item quantity: (item quantity - quantity).
	^true</body>
</methods>

</st-source>
