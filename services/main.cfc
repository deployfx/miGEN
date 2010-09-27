/*
	Migration Tracking System

	Provides support functionality for the admin area.
*/
component {
	function init() {
		// do nothing
	}
    
    // LOOKUP FUNCTIONS
    function lookups(){
        // returns lookups needed by apps
        ret = {};
        ret['applications'] = EntityToQuery(EntityLoad("Applications"));
        
        return ret;
    }
    
    // GET FUNCTIONS
    function get(string id){
        // this function grabs an application
        var ret = {};
        if( StructKeyExists(arguments,"id") && isNumeric(arguments.id) ) ret.record = EntityLoadByPK("Migrations", arguments.id);
        
        // if we get nothing, return a blank object
        if( isNull(ret.record) ) ret.record = EntityNew("Migrations");

        return ret;
    }
    
    // persist to the db!
    function save(id="", application="", ticketNumber="", description="", due=""){
        // prepare stub app object
        if( arguments.id == "" ) ret.app = EntityNew("Migrations");
        else ret.app = EntityLoadByPK("Migrations",arguments.id);
        
        try {
            // issued
            if( arguments.issued == "" ) ret.app.setIssued(JavaCast("null",""));
            else ret.app.setIssued(arguments.issued);
            
            EntitySave(ret.app);
            ormFlush(); // if there is an error, it will be reported asap
            
        }
        catch(java.lang.Exception e) {
            // deal with hibernate errors
        }
    }
}