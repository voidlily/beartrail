<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® NonCommercial, 7.6 of March 3, 2008 on October 24, 2008 at 8:37:14 pm</time-stamp>


<class>
<name>DBInfo</name>
<environment>OregonTrail</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>user pass database host connection </inst-vars>
<class-inst-vars>instance </class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>OregonTrail</package>
</attributes>
</class>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<methods>
<class-id>OregonTrail.DBInfo class</class-id> <category>instance creation</category>

<body package="OregonTrail" selector="instance">instance
	instance ifNil:[instance := self basicNew initialize.].
	^instance</body>

<body package="OregonTrail" selector="new">new
	"Answer a newly created and initialized instance."

	^DBInfo instance</body>
</methods>

<methods>
<class-id>OregonTrail.DBInfo class</class-id> <category>accessing</category>

<body package="OregonTrail" selector="connection">connection
	^DBInfo instance connection</body>

<body package="OregonTrail" selector="database">database
	^DBInfo instance database"replace with actual database name"</body>

<body package="OregonTrail" selector="host">host
	^DBInfo instance host "replace with actual hostname"</body>

<body package="OregonTrail" selector="pass">pass
	^DBInfo instance pass</body>

<body package="OregonTrail" selector="user">user
	^DBInfo instance user</body>
</methods>

<!-- -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   -->


<comment>
<class-id>OregonTrail.DBInfo</class-id>
<body>Abstracts out the database information through class methods to access a singleton instance. Change initialize method to update database info.

Instance Variables:
	database	&lt;String&gt;	database name
	host	&lt;String&gt;	database host
	pass	&lt;String&gt;	password
	user	&lt;String&gt;	username

</body>
</comment>

<methods>
<class-id>OregonTrail.DBInfo</class-id> <category>initialize-release</category>

<body package="OregonTrail" selector="initialize">initialize
	"Initialize a newly created instance. This method must answer the receiver."

	" *** Replace the following data with actual db info *** "
	host:='localhost'.
	user:='oregontrail'.
	pass:='password'.
	database:='oregontrail'.
	^self</body>
</methods>

<methods>
<class-id>OregonTrail.DBInfo</class-id> <category>accessing</category>

<body package="OregonTrail" selector="connection">connection
	connection ifNil: [
	connection := MySQLConnection new.
	connection
		username: user;
		password: pass;
		environment: host;
		database: database.].
^connection</body>

<body package="OregonTrail" selector="database">database
	^database</body>

<body package="OregonTrail" selector="database:">database: anObject
	database := anObject</body>

<body package="OregonTrail" selector="host">host
	^host</body>

<body package="OregonTrail" selector="host:">host: anObject
	host := anObject</body>

<body package="OregonTrail" selector="pass">pass
	^pass</body>

<body package="OregonTrail" selector="pass:">pass: anObject
	pass := anObject</body>

<body package="OregonTrail" selector="user">user
	^user</body>

<body package="OregonTrail" selector="user:">user: anObject
	user := anObject</body>
</methods>

</st-source>
