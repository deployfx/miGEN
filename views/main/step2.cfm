<div class="grid_6" id="generate-left">
		
	<h2><img src="./assets/img/logistics.png" /> determine the logistics</h2>
	
	<form action="" method="post" id="form" class="stn-form"> 
        <div class="field"> 
            <label for="fname">Application <em class="required">*</em></label> 
            <select>
                <option value="sln">ATS</option>
                <option value="ats">SLN</option>
                <option value="voc">VOC</option>
            </select>
            <a class="help"><span>The application this change pertains to.</span></a> 
            <span class="errorText">For some reason, you made an invalid choice</span> 
        </div> 
                
        <div class="field"> 
            <label for="lname">Track-it Ticket # </label> 
            <input id="lname" name="lname" size="35" type="text" /> 
            <a class="help"><span>If there is a related track-it ticket, enter it here.</span></a> 
        </div> 
        
        
        <div class="field"> 
            <label for="telephone">Description <em class="required">*</em></label> 
            <textarea style="width:550px;height:100px;">test</textarea>
            <a class="help"><span>Please describe your request.  Short and sweet please!</span></a> 

        </div> 
        
        <div class="field"> 
            <label for="lname">Due Date  <em class="required">*</em></label> 
            <input id="lname" name="lname" size="35" type="text" /> 
            <a class="help"><span>When does this need to be completed.</span></a> 
        </div> 
        
        <p></p>
    
        <p class="line"></p>
        
        <p class="button">
            <button class="light-green medium">proceed</button> 
        </p>
	</form> 
    
    
</div>