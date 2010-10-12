<!--- This function was provided in CF901.  When we update to 901 this can be removed --->
<cfcomponent hint="I handle AJAX File Uploads from Valum's AJAX file uploader library">

    <cffunction name="remove" access="remote" returnformat="json">
        <cfargument name="location" type="string" required="true">
        <cfargument name="qqfile" type="string" required="true" />
        
        <cftry>
            <cffile action="delete" file="#arguments.location#\#arguments.qqfile#" />
            <cfreturn true>
            
            <cfcatch type="any">
                <cfreturn true>
            </cfcatch>
        </cftry>
    </cffunction>

    <cffunction name="Upload" access="remote" output="false" returntype="any" returnformat="JSON" >
        <cfargument name="qqfile" type="string" required="true">
        <cfargument name="destination" type="string" required="true" />
        
        <cfset x = GetHttpRequestData()>
        
        <!--- check if XHR data exists --->
        <cfif len(x.content) gt 0>
            <cfreturn UploadFileXhr(arguments.qqfile,x.content,arguments.destination) />       
        <cfelse>
            <!--- no XHR data process as standard form submission --->
            <cffile action="upload" fileField = "qqfile" destination ="#arguments.destination#" nameConflict = "makeunique"  />
            <cfset msgStruct['success']= true />
            <cfset msgStruct['type']= 'form' />

            <cfreturn serializeJSON(msgStruct) /> 
        </cfif>
    </cffunction>


    <cffunction name="UploadFileXhr" access="private" output="false" returntype="any">
        <cfargument name="qqfile" type="string" required="true">
        <cfargument name="content" type="any" required="true">
        <cfargument name="destination" type="string" required="true">

        <!--- write the contents of the http request to a file.  
        The filename is passed with the qqfile variable --->
        <cffile action="write" file="#arguments.destination#/#arguments.qqfile#" output="#content#" >

        <!--- if you want to return some JSON you can do it here.  
        I'm just passing a success message  --->

        <cfset msgStruct['success']= true />
        <cfset msgStruct['type']= 'xhr' />

        <cfreturn serializeJSON(msgStruct) />

    </cffunction>

</cfcomponent>