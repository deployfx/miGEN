<div class="grid_6" id="generate-left">
		
	<h2><img src="./assets/img/logistics.png" /> what needs to be done?</h2>
	
	<form action="<cfoutput>#buildURL('main.save')#</cfoutput>" method="post" id="form" class="stn-form"> 
        <!--- Hold the ID of the current application record --->
        <input name="id" type="hidden" value="<cfoutput>#rc.app.record.getId()#</cfoutput>" />
    
        <div class="field"> 
            <label for="application">Application <em class="required">*</em></label> 
            <select name="application">
                <cfif isNull(rc.app.record.getApplication())>
                    <option value=""></option>
                </cfif>
                <cfoutput query="rc.lookups.applications">
                    <option value="#ID#" <cfif !isNull(rc.app.record.getApplication()) AND rc.app.record.getApplication().getId() EQ ID >selected="selected"</cfif> >#NAME#</option>
                </cfoutput>
            </select>
            <a class="help"><span>The application this change pertains to.</span></a> 
            <span class="errorText">For some reason, you made an invalid choice</span> 
        </div> 
                
        <div class="field"> 
            <label for="ticketNumber">Track-it Ticket # </label> 
            <cfoutput><input id="ticketNumber" name="ticketNumber" size="35" type="text" value="#rc.app.record.getTicketNumber()#" /> </cfoutput>
            <a class="help"><span>If there is a related track-it ticket, enter it here.</span></a> 
        </div> 
        
        
        <div class="field"> 
            <label for="description">Description <em class="required">*</em></label> 
            <textarea id="description" name="description" style="width:550px;height:100px;"><cfoutput>#rc.app.record.getDescription()#</cfoutput></textarea>
            <a class="help"><span>Please describe your request.  Short and sweet please!</span></a> 

        </div> 
        
        <div class="field"> 
            <label for="due">Due Date  <em class="required">*</em></label> 
            <cfoutput><input class="datepicker" name="due" type="text" value="#DateFormat(rc.app.record.getDue(), 'm/d/yyyy')#" /></cfoutput>
            <a class="help"><span>When does this need to be completed.</span></a> 
        </div> 
        
        <p></p>
    
        <p class="line"></p>
        
        <p class="button">
            <button class="light-green medium">proceed</button> 
        </p>
	</form> 
    
    
</div>