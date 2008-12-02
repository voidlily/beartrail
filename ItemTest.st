<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on December 1, 2008 at 6:10:36 pm</time-stamp>


<class>
<name>ItemTest</name>
<environment>OregonTrail</environment>
<super>XProgramming.SUnit.TestCase</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>newItem </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.ItemTest class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.ItemTest</class-id>
<body>Item unit test

Instance Variables:
	newItem	&lt;Item&gt;	description of newItem

</body>
</comment>

<methods>
<class-id>OregonTrail.ItemTest</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."
	newItem := nil.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>OregonTrail.ItemTest</class-id> <category>Running</category>

<body package="OregonTrail" selector="setUp">setUp
	newItem := Item new.</body>

<body package="OregonTrail" selector="testPopulate">testPopulate
	"Tests the populate method of the Item class."

     newItem := Item populate: 'Money' wagon: 1.
     self assert: (newItem name = 'Money').
     self assert: (newItem weight = 0).
	self assert: (newItem quantity = 500).

	newItem := Item populate: 'Food' wagon: 1.
     self assert: (newItem name = 'Food').
     self assert: (newItem weight = 1).
	self assert: (newItem quantity = 100).

     newItem := Item populate: 'Wheel' wagon: 1.
     self assert: (newItem name = 'Wheel').
     self assert: (newItem weight = 75).
	self assert: (newItem quantity = 1).</body>
</methods>

</st-source>
