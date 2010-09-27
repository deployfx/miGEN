<cfcomponent>
	<cffunction name="init">
		<cfargument name="configFile" type="string" required="yes" />
        <cfargument name="commonConfiguration" type="string" required="no" default="common" />
        
		<cfset variables.configFile = arguments.configFile />
        <cfset variables.commonConfiguration = arguments.commonConfiguration />
        
		<cfreturn this />
	</cffunction>

    <!--- Only the variables listed in the public section will be returned --->
    <cffunction name="getPublicSettings" access="remote" return="struct" output="yes">
        <cfset var settings = getSettings() />
        <cfset var publicSections = parseSection("public") />
        
        <cfloop collection=#publicSections# item="setting">
            <cfset publicSections[setting] = settings[publicSections[setting]] />
        </cfloop>
        
        <cfreturn publicSections />
    </cffunction>
    
	<cffunction name="getSettings" return="struct" output="yes">
        <cfscript>
            // Grab the common default configuration
            var settings = parseSection("common");
            
            // And overwrite it with any server specific configuration
            StructAppend(settings, parseSection(CGI.SERVER_NAME), True);
            
            // Return the settings
            return settings;
        </cfscript>
	</cffunction>

	<cffunction name="getSetting" hint="reads configuration setting from file">
		<cfargument name="setting" type="string"
			hint="type of setting to read" />

		<cfreturn getProfileString(variables.configFile,
		CGI.SERVER_NAME, arguments.setting) />
	</cffunction>
    
    <cffunction name="parseSection" access="private" hint="returns an entire parsed section, or an empty struct">
        <cfargument name="sectionName" required="yes" type="string" />
        <cfset var configurationSections = getProfileSections(variables.configFile) />
        <cfset var ret = StructNew() />

        <cftry>
            <cfloop list="#StructFind(configurationSections, sectionName)#" index="entry">
                <cfset StructInsert(ret, entry, trim(GetProfileString(variables.configFile,arguments.sectionName,entry)), True) />
            </cfloop>
            
            <cfcatch type="any">
                <!--- If we get to here, then there is no server specific configuration so we will ignore it --->
            </cfcatch>
        </cftry>
        
        <!--- Return whatever we got --->
        <cfreturn ret />
    </cffunction>
</cfcomponent>