/**
 * @persistent
 */
component schema="MIGRATION" table="A_APPLICATIONS"
{
    property name="Id" fieldtype="id" generator="sequence" ormtype="int" params="{sequence='A_SEQ'}";
    property name="Name" column="NAME";
    property name="Steward" column="STEWARD";
    property name="SchemaOwner" column="SCHEMA_OWNER";
    property name="SchemaReader" column="SCHEMA_READER";
    property name="InternalDevelopmentServer" column="INTERNAL_DEV_SERVER";
    property name="InternalDevelopmentDatabase" column="INTERNAL_DEV_SID";
    property name="InternalTestServer" column="INTERNAL_TEST_SERVER";
    property name="InternalTestDatabase" column="INTERNAL_TEST_SID";
    property name="InternalStageServer" column="INTERNAL_STAGE_SERVER";
    property name="InternalStageDatabase" column="INTERNAL_STAGE_SID";
    property name="InternalProductionServer" column="INTERNAL_PROD_SERVER";
    property name="InternalProductionDatabase" column="INTERNAL_PROD_SID";
    property name="ExternalDevelopmentServer" column="EXTERNAL_DEV_SERVER";
    property name="ExternalDevelopmentDatabase" column="EXTERNAL_DEV_SID";
    property name="ExternalTestServer" column="EXTERNAL_TEST_SERVER";
    property name="ExternalTestDatabase" column="EXTERNAL_TEST_SID";
    property name="ExternalStageServer" column="EXTERNAL_STAGE_SERVER";
    property name="ExternalStageDatabase" column="EXTERNAL_STAGE_SID";
    property name="ExternalProductionServer" column="EXTERNAL_PROD_SERVER";
    property name="ExternalProductionDatabase" column="EXTERNAL_PROD_SID";
    
    // Application Migrations (all)
    property name="Migrations" fkcolumn="A_ID" cfc="Migrations" type="array" fieldtype="one-to-many" orderby="CREATED_DATE asc";
}