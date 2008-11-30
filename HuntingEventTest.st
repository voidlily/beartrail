<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on November 30, 2008 at 1:46:32 pm</time-stamp>


<class>
<name>HuntingEventTest</name>
<environment>OregonTrail</environment>
<super>XProgramming.SUnit.TestCase</super>
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
<class-id>OregonTrail.HuntingEventTest class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.HuntingEventTest</class-id>
<body>unit test for HuntingEvent</body>
</comment>

<methods>
<class-id>OregonTrail.HuntingEventTest</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="OregonTrail" selector="testRun">testRun
	|ammo food wagon|
	ammo := 5.
	food := 100.
	wagon := Wagon new.
	(wagon inventory at: 'Food' put: Item new).
	(wagon inventory at: 'Food') quantity: food.
	(wagon inventory at: 'Ammo' put: Item new).
	(wagon inventory at: 'Ammo') quantity: ammo.
	EventFactory huntingEvent: wagon.
	self assert:((wagon inventory at: 'Food') quantity &gt; food).
	self assert:((wagon inventory at: 'Ammo') quantity &lt; ammo).</body>
</methods>

</st-source>
