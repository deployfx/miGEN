<DOCTYPE<!DOCTYPE html> 
<html> 
	<head>
		<title><cfoutput>#this.config.short_name#<cfif StructKeyExists(rc,"title")> - #rc.title#</cfif></cfoutput></title>
		<link rel="stylesheet" href="assets/stylesheets/reset.css" type="text/css" />
		<link rel="stylesheet" href="assets/stylesheets/text.css" type="text/css" />
        <cfif rc.action EQ "main.start">
		<link rel="stylesheet" href="assets/stylesheets/480.css" type="text/css" />
        <cfelse>
        <link rel="stylesheet" href="assets/stylesheets/960.css" type="text/css" />
        </cfif>
		<link rel="stylesheet" href="assets/stylesheets/application.css" type="text/css" />
        <link rel="stylesheet" href="assets/stylesheets/forms.css" type="text/css" media="screen" title="no title" charset="utf-8" /> 
        <link rel="stylesheet" href="assets/stylesheets/buttons.css" type="text/css" media="screen" title="no title" charset="utf-8" />
		<script type="text/javascript" src="assets/javascripts/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="assets/javascripts/cufon-yui.js"></script>
		<script type="text/javascript" src="assets/javascripts/ChunkFive_400.font.js"></script>
		<script type="text/javascript" src="assets/javascripts/application.js"></script>
	</head>
	<body>
		<h1><cfoutput>#this.config.short_name#</cfoutput></h1>
		<div class="container_6">
		<cfoutput>#body#</cfoutput>
		</div>
	</body>
</html>