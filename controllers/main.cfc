/*
	Migration Tracking System

	Provides view specific functionality for the admin area.
*/
component {
    function init(fw) {
        variables.fw = fw;
    }

    private function blankPage(any rc){
        request.layout = false;
        getpagecontext().getcfoutput().clearall();
        return;
    }
    
    // UPLOAD FUNCTIONALITY
    function upload(any rc){
        blankPage();
        
        // certain file operations are not supported in script style
        // until cf901, so just include it here
        rc.fileObj = new assets.cfc.file();
    }
    
    // REMOVE FUNCTIONALITY
    function remove(any rc){
        blankPage();
        
        // certain file operations are not supported in script style
        // until cf901, so just include it here
        rc.fileObj = new assets.cfc.file();
    }
    
    // LOADING FUNCTIONS
    private function loadChange(any rc){ // provides us with lookups, app persistent model, and official application name
        // load app dependencies
        variables.fw.service("main.lookups","lookups");
        
        // load the app
        variables.fw.service("main.get","app");
    }

	function start(any rc) {
		rc.title="Home";
        rc.designId="I-1.0";
	}
    
    function change(any rc){
        loadChange(rc);
    
        rc.title="Change Request";
        rc.designId="I-7.0";
    }
    
    function endSave(any rc){
        // was there an error?
        if( !isNull(rc.data.error) ){
            rc.notice = {type="error", message=rc.data.error.message};
        } else {
            rc.notice = {type="success", message="Record saved"};
        }

        // oki doki, to the page!
        rc.id = rc.data.app.getId();
        variables.fw.redirect("main.files","notice","id");
    }
}