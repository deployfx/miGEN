<script type="text/javascript">
    $(function() {
        $("#file-manager tbody td:not(.environment)").each(function() {
            var environment = $(this).parent("tr").attr("data-environment");
            var stage = $(this).attr("data-stage");
            
            new qq.FileUploader({
                element: $(this)[0],
                action: '<cfoutput>#buildURL("main.upload")#</cfoutput>',
                removeAction: '<cfoutput>#buildURL("main.remove")#</cfoutput>',
                allowedExtensions: ['sql'],
                minSizeLimit: 0, // no empty files!
                params: {
                    prefix: '<cfoutput>#rc.id#</cfoutput>' + '_' + $(this).parent().attr('data-environment') + '_' + $(this).attr('data-stage')
                },
                initialFiles: eval($(this).attr('data-files'))
            });
        });
    });
</script>

<div class="grid_6" id="generate-left">
		
	<h2><img src="./assets/img/fix.png" /> upload your code</h2>
    
    <table id="file-manager"> 
		<thead> 
			<tr> 
				<th>Environment</th> 
				<th>Development</th> 
				<th>Testing</th> 
				<th>Staging</th> 
				<th>Production</th> 
			</tr> 
		</thead> 
		<tbody> 
            <cfoutput>
			<tr data-environment="internal"> 
				<td class="environment">Internal</td> 
				<td data-stage="development" data-files='#rc.int_development#'></td> 
				<td data-stage="testing" data-files='#rc.int_testing#'></td> 
				<td data-stage="staging" data-files='#rc.int_staging#'></td> 
				<td data-stage="production" data-files='#rc.int_production#'></td> 
			</tr> 
			<tr data-environment="external"> 
				<td class="environment">External</td> 
				<td data-stage="development" data-files='#rc.ext_development#'></td> 
				<td data-stage="testing" data-files='#rc.ext_testing#'></td> 
				<td data-stage="staging" data-files='#rc.ext_staging#'></td> 
				<td data-stage="production" data-files='#rc.ext_production#'></td> 
			</tr> 
            </cfoutput>
		</tbody> 
	</table>
    
    <p class="line"></p>
        
    <p class="button">
        <button class="light-green medium" onclick="javascript:window.location='<cfoutput>#buildURL('main.done&id=' & rc.id)#</cfoutput>'">Summary</button> 
    </p>
</div>