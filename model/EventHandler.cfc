/**
* Application wide event handler for ORM operations
* @output false
* @implements cfide.orm.IEventHandler
*/
component
{

    public void function preInsert( any entity )
    {  
        /** Determine if one of the audit fields
          * ASSUMPTION: If it exists, so do the others
          * BASIS: If only one audit field exists then this should
          * error out.  No need to do extra processing for the same
          * ending!
          */
        if( StructKeyExists(entity,"setCreatedBy") ){
            var ts = now();
            entity.setCreatedBy( cgi.auth_user );
            entity.setUpdatedBy( cgi.auth_user );
            entity.setCreated( ts );
            entity.setUpdated( ts );
        }
    }

    public void function preUpdate( any entity, Struct oldData )
    {
        /** Determine if one of the audit fields
          * ASSUMPTION: If it exists, so do the others
          * BASIS: If only one audit field exists then this should
          * error out.  No need to do extra processing for the same
          * ending!
          */
        if( StructKeyExists(entity,"setCreatedBy") ){
            entity.setUpdatedBy( cgi.auth_user);
            entity.setUpdated( now() );
        }
    }
  
    // Not currently implemented
    public void function postDelete( any entity ){}
    public void function preDelete( any entity ){}
    public void function postUpdate( any entity ){}
    public void function postInsert( any entity ){}
    public void function postLoad( any entity ){}
    public void function preLoad( any entity ){}

}