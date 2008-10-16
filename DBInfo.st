<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on October 16, 2008 at 8:05:42 am</time-stamp>


<class>
<name>DBInfo</name>
<environment>OregonTrail</environment>
<super>Core.Object</super>
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
<class-id>OregonTrail.DBInfo class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^super new initialize</body>
</methods>

<methods>
<class-id>OregonTrail.DBInfo class</class-id> <category>accessing</category>

<body package="OregonTrail" selector="database">database
	^'oregontrail' "replace with actual database name"</body>

<body package="OregonTrail" selector="host">host
	^'localhost' "replace with actual hostname"</body>

<body package="OregonTrail" selector="pass">pass
	^'password' "replace with actual password"</body>

<body package="OregonTrail" selector="user">user
	^'oregontrail' "replace with actual user"</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.DBInfo</class-id>
<body>Abstracts out the database information through class methods. Changing these methods will update database information for the entire project.
</body>
</comment>

<methods>
<class-id>OregonTrail.DBInfo</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace this comment with the appropriate initialization code *** "
	^self</body>
</methods>

</st-source>
