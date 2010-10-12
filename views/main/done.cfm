<cfset helper = new assets.cfc.helpers() />
<div class="grid_6" id="generate-left">
	<cfoutput>	
	<h2>Thank you, your order number is <span style="color:green"><cfoutput>#rc.id#</cfoutput></span> (due #dateFormat(rc.app.record.getDue(),"dddd, m/d/yyyy")#)</h2>
	<h4>Summary (<a href="#buildURL('main.change&id=' & rc.id)#">edit</a>)</h4>
    <p>
    <strong>Request Created by #rc.app.record.getCreatedBy()# on #dateFormat(rc.app.record.getCreated(),"m/d/yyyy (dddd)")# at #timeFormat(rc.app.record.getCreated(),"h:mm tt")#</strong><br />
    <strong>Target Application:</strong> #rc.app.record.getApplication().getName()# (data steward is #rc.app.record.getApplication().getSteward()#)<br />
    <strong>Related Track-It Tickets:</strong> #rc.app.record.getTicketNumber()#<br />
    <strong>Description:</strong>#rc.app.record.getDescription()#
    </cfoutput>
    </p>
    
    <h4><cfoutput>Submitted Code (partial) (<a href="#buildURL('main.files&id=' & rc.id)#">edit</a>)</cfoutput></h4>
    <cfloop array="#rc.changeFiles#" index="i"> 
        <strong><cfoutput>#i.name#</cfoutput></strong><br />
        <script type="syntaxhighlighter" class="brush: sql"><![CDATA[
        <cfscript>
            savecontent variable="theFile" {
                GetPageContext().Include("../../assets/migrations/queued/" & i.name); 
            }
            WriteOutput(StripCR(Mid(theFile,1,800)));
        </cfscript>
        ]]></script>
        
    </cfloop>
    
    <p class="line"></p>
	
	<p class="button">
		<cfoutput><a href="#buildURL('main.start')#">Close</a></cfoutput>
	</p>
</div>