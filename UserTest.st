<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on November 26, 2008 at 4:11:27 pm</time-stamp>


<class>
<name>UserTest</name>
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
<class-id>OregonTrail.UserTest class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.UserTest</class-id>
<body>test users

</body>
</comment>

<methods>
<class-id>OregonTrail.UserTest</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>OregonTrail.UserTest</class-id> <category>Running</category>

<body package="OregonTrail" selector="setUp">setUp
    "Prepares all necessary data structures and data for testing User class."</body>
</methods>

<methods>
<class-id>OregonTrail.UserTest</class-id> <category>testing</category>

<body package="OregonTrail" selector="testPopulate">testPopulate
    "Tests the populate method."</body>
</methods>

</st-source>