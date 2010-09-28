/**
 * @persistent
 */
component schema="MIGRATION" table="M_MIGRATIONS" 
{
    property name="Id" fieldtype="id" generator="sequence" ormtype="int" params="{schema='MIGRATION',sequence='M_SEQ'}";
    property name="Application" fkcolumn="A_ID" cfc="Applications" fieldtype="one-to-one";
    property name="Due" column="DUE";
    property name="Completed" column="COMPLETED";
    property name="TicketNumber" column="TRACKIT_WORKORDER";
    property name="Description" column="DESCRIPTION";
    
    // Migration Comments
    property name="Comments" fkcolumn="M_ID" cfc="MigrationComments" type="array" fieldtype="one-to-many" orderby="CREATED_DATE asc";

    // Auditing fields
    property name="CreatedBy" column="CREATED_USER";
    property name="Created" column="CREATED_DATE";
    property name="UpdatedBy" column="UPDATED_USER";
    property name="Updated" column="UPDATED_DATE" fieldtype="timestamp";  
}