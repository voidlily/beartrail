<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on November 26, 2008 at 9:38:37 pm</time-stamp>


<class>
<name>DatabaseManager</name>
<environment>OregonTrail</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars>connection </class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.DatabaseManager class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="inputQuery:"></body>

<body package="OregonTrail" selector="new">new
	"	***This is decompiled code.*** 
	No source was available"

	(connection := ODBCConnection new) environment: '2340'; username: 'user'; password: 'pass'.
	^self</body>

<body package="OregonTrail" selector="selectQuery:"></body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.DatabaseManager</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize"></body>
</methods>

</st-source>
