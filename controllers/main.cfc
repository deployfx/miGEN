/*
	Migration Tracking System

	Provides view specific functionality for the admin area.
*/
component {
    function init(fw) {
        variables.fw = fw;
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
}