/*
	Migration Tracking System

	Provides support functionality for the admin area.
*/
component {
	function init() {
		// do nothing
	}
    
    // DIRECTORY LISTING FUNCTIONALITY
    function directoryListing(id, directory, pattern){
        var dirs = DirectoryList(arguments.directory,false,"query",id & "_" & arguments.pattern,"datelastmodified");
        var ret = [];
        for( i=1; i <= dirs.RecordCount; i++ ){
            ArrayAppend(ret,{name=dirs.NAME[i],size=dirs.SIZE[i]});
        }
        return LCase(serializeJSON(ret));
    }
    
    // UPLOAD FUNCTIONALITY
    function upload(string prefix, any fileObj, any qqfile){
        var ret = {};
        ret.success = true;
        ret.filename = arguments.prefix & "_" & arguments.qqfile;
        arguments.fileObj.upload(ret.filename, ExpandPath('./assets/migrations/queued'));
        return LCase(serializeJSON(ret));
    }
    
    // REMOVE UPLOAD FILE FUNCTIONALITY
    function remove(string filename, any fileObj){
        var ret = {};
        ret.success = arguments.fileObj.remove(ExpandPath('./assets/migrations/queued'), arguments.qqfile);
        return LCase(serializeJSON(ret));
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
        // save the app
        local.ret = {};
        
        // prepare stub app object
        if( arguments.id == "" ) ret.app = EntityNew("Migrations");
        else ret.app = EntityLoadByPK("Migrations",arguments.id);
        
        try {
            // which application?
            if( arguments.application == "" ) ret.app.setApplication(JavaCast("null",""));
            else ret.app.setApplication(EntityLoadByPK("Applications",arguments.application));
            
            // ticket number
            if( arguments.ticketNumber == "" ) ret.app.setTicketNumber(JavaCast("null",""));
            else ret.app.setTicketNumber(arguments.ticketNumber);
            
            // description
            if( arguments.description == "" ) ret.app.setDescription(JavaCast("null",""));
            else ret.app.setDescription(arguments.description);
            
            // due date
            if( arguments.due == "" ) ret.app.setDue(JavaCast("null",""));
            else ret.app.setDue(arguments.due);
            
            EntitySave(ret.app);
            ormFlush(); // if there is an error, it will be reported asap
            
        }
        catch(java.lang.Exception e) {
            // deal with hibernate errors
            ret.error = {message=e};
        }
        
        return ret;
    }
}