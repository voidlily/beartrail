<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on December 2, 2008 at 6:42:38 pm</time-stamp>


<class>
<name>HealthChangeEvent</name>
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
<class-id>OregonTrail.HealthChangeEvent class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="for:value:">for: aWagon value: aValue
	|newEvent|
	newEvent := HealthChangeEvent new.
	newEvent wagon: aWagon.
	newEvent value: aValue.
	^newEvent</body>

<body package="OregonTrail" selector="new">new
	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.HealthChangeEvent</class-id>
<body>changes health - value is negative makes people sick value is positive makes people better</body>
</comment>

<methods>
<class-id>OregonTrail.HealthChangeEvent</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="OregonTrail" selector="run">run
	|person rand people|
	rand := Random new.
	(people := wagon people reject: [:x | ((x health = #good and: [value &gt; 0]) or: [x health = #dead])]) isEmpty ifTrue:[^nil].
	person := wagon people at: (rand next * (people size) + 1) truncated.
	[person health = #dead] whileTrue:[person := (wagon people at: (rand next * (people size) + 1) truncated)].
	value &lt; 0 ifTrue:[
	person health = #good ifTrue:[person health: #fair]
     ifFalse: [person health = #fair ifTrue:[person health: #poor]
     ifFalse: [person health = #poor ifTrue:[^nil]
     ifFalse: [person health = #dead ifTrue:[^nil]]]].
	]
	ifFalse:[
	person health = #poor ifTrue:[person health: #fair]
     ifFalse:[person health = #fair ifTrue:[person health: #good]
	ifFalse:[person health = #good ifTrue:[^nil]
	ifFalse:[person health = #dead ifTrue:[^nil]]]].
	].
	value &lt; 0 ifTrue:[^person name,' is ill'.]
			ifFalse:[^person name,' has recovered.'].</body>
</methods>

</st-source>
