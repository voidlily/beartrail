<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on October 24, 2008 at 8:38:00 pm</time-stamp>


<class>
<name>Item</name>
<environment>OregonTrail</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>name weight quantity </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.Item class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.Item</class-id>
<body>Represents a piece of equipment, food, or something a pioneer or settler would take along with him or her on the Oregon Trail.

name   &lt;String&gt;   The name of this item.
weight   &lt;Integer&gt;   The weight of this item in pounds.
quantity   &lt;Integer&gt;   The number of this item in a wagon.

</body>
</comment>

<methods>
<class-id>OregonTrail.Item</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="OregonTrail" selector="named:weight:quantity:">named: newName weight: newWeight quantity: newQuantity
	"Initializes and returns a new item with the specifications passed into this method."

	|newItem|

     newItem := Item new.
     newItem name: newName.
     newItem weight: newWeight.
     newItem quantity: newQuantity.

     ^newItem.</body>
</methods>

<methods>
<class-id>OregonTrail.Item</class-id> <category>accessing</category>

<body package="OregonTrail" selector="name">name
	"Returns the name of this item."

	^self name.</body>

<body package="OregonTrail" selector="name:">name: newName
	"Sets the name of this item."

	name := newName.</body>

<body package="OregonTrail" selector="quantity">quantity
	"Returns the quantity of this item."

	^self quantity.</body>

<body package="OregonTrail" selector="quantity:">quantity: newQuantity
	"Sets the amount of this item in a wagon."

	quantity := newQuantity.</body>

<body package="OregonTrail" selector="weight">weight
	"Returns the weight of this item in pounds."

	^self weight.</body>

<body package="OregonTrail" selector="weight:">weight: newWeight
	"Sets the weight of this item."

	weight := newWeight.</body>
</methods>

</st-source>
