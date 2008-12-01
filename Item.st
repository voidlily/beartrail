<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on December 1, 2008 at 9:14:09 am</time-stamp>


<class>
<name>Item</name>
<environment>OregonTrail</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>name weight quantity wagon_id item_id </inst-vars>
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

<body package="OregonTrail" selector="populate:wagon:">populate: item_name wagon: wagon_id

	| item query result |
	item := Item new.
	item wagon_id: wagon_id.
	query := 'SELECT t1.item_id, t1.item_name, t1.weight, t2.item_quantity from itemdata as t1, items as t2 where t1.item_name = ', item_name printString, ' and t2.wagon_id = ', wagon_id printString, ' and t1.item_id = t2.item_id;'.
	result := DBManager selectQuery: query.

	result isEmpty ifFalse:
		[item item_id: ((result at: 1) at: 1); name: ((result at: 1) at: 2); weight: ((result at: 1) at: 3); quantity: ((result at: 1) at: 4)].
	^item</body>
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
	quantity := 0.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>OregonTrail.Item</class-id> <category>accessing</category>

<body package="OregonTrail" selector="item_id">item_id
	^item_id</body>

<body package="OregonTrail" selector="item_id:">item_id: anObject
	item_id := anObject</body>

<body package="OregonTrail" selector="name">name
	"Returns the name of this item."

	^name.</body>

<body package="OregonTrail" selector="name:">name: newName
	"Sets the name of this item."

	name := newName.</body>

<body package="OregonTrail" selector="quantity">quantity
	^quantity</body>

<body package="OregonTrail" selector="quantity:">quantity: anObject
	quantity := anObject</body>

<body package="OregonTrail" selector="save">save
	DatabaseManager update: 'UPDATE items set item_quantity = ', quantity printString, ' where item_id = ', item_id printString, ';'.</body>

<body package="OregonTrail" selector="totalWeight">totalWeight
	^quantity*weight</body>

<body package="OregonTrail" selector="wagon_id">wagon_id
	^wagon_id</body>

<body package="OregonTrail" selector="wagon_id:">wagon_id: anObject
	wagon_id := anObject</body>

<body package="OregonTrail" selector="weight">weight
	"Returns the weight of this item in pounds."
	^weight.</body>

<body package="OregonTrail" selector="weight:">weight: newWeight
	"Sets the weight of this item."

	weight := newWeight.</body>
</methods>

<methods>
<class-id>OregonTrail.Item</class-id> <category>printing</category>

<body package="OregonTrail" selector="printString">printString
	^quantity printString, ' ', name, 's weighing ', weight printString, ' each (', self totalWeight printString,' total)'</body>
</methods>

</st-source>
