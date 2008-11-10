<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on November 10, 2008 at 2:30:32 pm</time-stamp>


<class>
<name>ItemTest</name>
<environment>OregonTrail</environment>
<super>OregonTrail.GameDataTest</super>
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

<comment>
<class-id>OregonTrail.ItemTest</class-id>
<body>This test class tests the populate method in Item.

</body>
</comment>

<methods>
<class-id>OregonTrail.ItemTest</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>

<body package="OregonTrail" selector="setup">setup 
	"Prepares the data necessary to test Item."

	newItem := Item new.</body>
</methods>

<methods>
<class-id>OregonTrail.ItemTest</class-id> <category>Running</category>

<body package="OregonTrail" selector="testPopulate">testPopulate
	"Tests the populate method of the Item class."

     newItem := Item populate: 1.
     self assert: (newItem name = 'money').
     self assert: (newItem weight = 0).

	newItem := Item populate: 3.
     self assert: (newItem name = 'food').
     self assert: (newItem weight = 1).

     newItem := Item populate: 5.
     self assert: (newItem name = 'wheel').
     self assert: (newItem weight = 75).</body>
</methods>

</st-source>
