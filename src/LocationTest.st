<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on December 1, 2008 at 6:10:41 pm</time-stamp>


<class>
<name>LocationTest</name>
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

<comment>
<class-id>OregonTrail.LocationTest</class-id>
<body>This test class tests the at: route: method and populate method in Location.

</body>
</comment>

<methods>
<class-id>OregonTrail.LocationTest</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	super initialize.
	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

<methods>
<class-id>OregonTrail.LocationTest</class-id> <category>testing</category>

<body package="OregonTrail" selector="testPopulate">testPopulate
	"Tests the populate method of Location."

    |location|
    location := Location populate: 6.
    self assert:(location name = 'Fort Laramie').
    self assert:(location distanceTraveled = 640).
    self assert:(location bridgerDistance = 640).
    self assert:(location columbiaEvent = 0).
    self assert:(location hasRiver = 0).
    self assert:(location hasStore = 1).</body>
</methods>

</st-source>
