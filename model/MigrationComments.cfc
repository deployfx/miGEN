/**
 * @persistent
 */
component schema="MIGRATION" table="MC_MIGRATION_COMMENTS" 
{
    property name="Id" fieldtype="id" generator="sequence" ormtype="int" params="{sequence='MC_SEQ'}";
    property name="Migration" fkcolumn="M_ID" cfc="Migrations" fieldtype="one-to-one";
    property name="Comment" column="COMMENT";
    
    // Auditing fields
    property name="CreatedBy" column="CREATED_USER";
    property name="Created" column="CREATED_DATE";
    property name="UpdatedBy" column="UPDATED_USER";
    property name="Updated" column="UPDATED_DATE" fieldtype="timestamp";  
}