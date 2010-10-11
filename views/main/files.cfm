<script type="text/javascript">
    $(function() {
        $("#file-manager tbody td:not(.environment)").each(function() {
            var environment = $(this).parent("tr").attr("data-environment");
            var stage = $(this).attr("data-stage");
            
            new qq.FileUploader({
                element: $(this)[0],
                action: '<cfoutput>#buildURL("main.upload")#</cfoutput>',
                allowedExtensions: ['sql'],
                minSizeLimit: 0, // no empty files!
                params: {
                    stage: $(this).attr('data-stage'),
                    environment: $(this).parent().attr('data-environment'),
                    id: <cfoutput>#rc.id#</cfoutput>
                },
                initialFiles: eval($(this).attr('data-files'))
            });
        });
    });
</script>

<div class="grid_6" id="generate-left">
		
	<h2><img src="./assets/img/fix.png" /> upload your code</h2>
    
    <table id="file-manager" style="width:940px"> 
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
			<tr data-environment="internal"> 
				<td class="environment">Internal</td> 
				<td data-stage="development" data-files="[{name:'upload.sql',size: '27.9k'},{name:'testing.sql',size: '39.1k'}]"></td> 
				<td data-stage="testing"></td> 
				<td data-stage="staging"></td> 
				<td data-stage="production" data-files="[{name:'upload.sql',size: '27.9k'},{name:'testing.sql',size: '39.1k'}]"></td> 
			</tr> 
			<tr data-environment="external"> 
				<td class="environment">External</td> 
				<td data-stage="development"></td> 
				<td data-stage="testing"></td> 
				<td data-stage="staging"></td> 
				<td data-stage="production"></td> 
			</tr> 
		</tbody> 
	</table>
    
    <p class="line"></p>
        
    <p class="button">
        <button class="light-green medium" onclick="javascript:window.location='<cfoutput>#buildURL('')#</cfoutput>'">finish</button> 
    </p>
</div>