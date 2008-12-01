<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on December 1, 2008 at 9:15:42 am</time-stamp>


<class>
<name>StoreTest</name>
<environment>OregonTrail</environment>
<super>XProgramming.SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>store </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.StoreTest class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.StoreTest</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>OregonTrail.StoreTest</class-id> <category>testing</category>

<body package="OregonTrail" selector="testAddItemPrice">testAddItemPrice
    "Tests the addItem: price: method."

    store addItem: 'Blankets' price: 1.5.
    self assert: (store inventory at: 'Blankets') = 1.5.</body>

<body package="OregonTrail" selector="testPopulate">testPopulate
    "Tests the populate method.  May need corrections if database schema is updated to use doubles instead?"

    self assert: store inventory size = 7.
    self assert:(store inventory at: 'Oxen') = 20.
    self assert:(store inventory at:'Food') = 0.2.
    self assert:(store inventory at: 'Clothes') = 10.
    self assert:(store inventory at: 'Ammo') = 2.
    self assert:(store inventory at:'Wheel') = 10.
    self assert:(store inventory at:'Axle') = 10.
    self assert:(store inventory at:'Tongue') = 10.</body>
</methods>

<methods>
<class-id>OregonTrail.StoreTest</class-id> <category>Running</category>

<body package="OregonTrail" selector="setUp">setUp
    "Sets ups all necessary data structures and data for testing."

    store := Store populate: 1.</body>
</methods>

</st-source>
