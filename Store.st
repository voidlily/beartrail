<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on October 24, 2008 at 8:38:07 pm</time-stamp>


<class>
<name>Store</name>
<environment>OregonTrail</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>inventory </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.Store class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>

<body package="OregonTrail" selector="storeAt:">storeAt: aLocation

	|store| store := Store new.
	store inventory: Dictionary new.
	"db queries to grab data - example 'store addItem: Item price: price'"</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.Store</class-id>
<body>Store has not been commented.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.

Instance Variables:
	inventory	&lt;Dictionary&gt; contains key-value pairs of Items to Floats (prices)

</body>
</comment>

<methods>
<class-id>OregonTrail.Store</class-id> <category>accessing</category>

<body package="OregonTrail" selector="addItem:price:">addItem: anItem price: aPrice
	inventory at: anItem put: aPrice</body>

<body package="OregonTrail" selector="inventory">inventory
	^inventory</body>

<body package="OregonTrail" selector="inventory:">inventory: anObject
	inventory := anObject</body>

<body package="OregonTrail" selector="populate:">populate: loc_id

| conn sess ans data |
	conn := DBInfo connection.
	[conn connect.
	sess := conn getSession.
	sess prepare: 'SELECT item_id, item_price from stores where loc_id = "', loc_id, '";'.
	sess bindInput: (Array with: 'SELECT').
	sess execute.
	ans := sess answer.
	[ans = #noMoreAnswers] whileFalse:
	     [ans = #noAnswerStream ifFalse: [data := ans upToEnd].
	     ans := sess answer]]
     ensure: [conn disconnect].

"self inventory: data."
"data isEmpty ifFalse: [self inventory: (data at: 1); distanceTraveled: (data at: 2); pace: (data at: 3); ration: (data at: 4); river: (data at: 5)]."</body>

<body package="OregonTrail" selector="priceOf:">priceOf: anItem
	^inventory at: anItem</body>
</methods>

<methods>
<class-id>OregonTrail.Store</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Edit the following to properly initialize instance variables ***"
	inventory := nil.
	" *** And replace this comment with additional initialization code *** "
	^self</body>
</methods>

</st-source>
