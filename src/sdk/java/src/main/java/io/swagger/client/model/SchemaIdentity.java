/*
 * self-managed-osdu
 * Rest API Documentation for Self Managed OSDU
 *
 * OpenAPI spec version: 0.11.0
 * 
 *
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen.git
 * Do not edit the class manually.
 */


package io.swagger.client.model;

import java.util.Objects;
import java.util.Arrays;
import com.google.gson.TypeAdapter;
import com.google.gson.annotations.JsonAdapter;
import com.google.gson.annotations.SerializedName;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.io.IOException;

/**
 * Schema authority source and type description
 */
@ApiModel(description = "Schema authority source and type description")
@javax.annotation.Generated(value = "io.swagger.codegen.languages.JavaClientCodegen", date = "2022-01-06T19:53:08.320Z")
public class SchemaIdentity {
  @SerializedName("authority")
  private String authority = null;

  @SerializedName("entityType")
  private String entityType = null;

  @SerializedName("id")
  private String id = null;

  @SerializedName("schemaVersionMajor")
  private Integer schemaVersionMajor = null;

  @SerializedName("schemaVersionMinor")
  private Integer schemaVersionMinor = null;

  @SerializedName("schemaVersionPatch")
  private Integer schemaVersionPatch = null;

  @SerializedName("source")
  private String source = null;

  public SchemaIdentity authority(String authority) {
    this.authority = authority;
    return this;
  }

   /**
   * Entity authority
   * @return authority
  **/
  @ApiModelProperty(example = "osdu", required = true, value = "Entity authority")
  public String getAuthority() {
    return authority;
  }

  public void setAuthority(String authority) {
    this.authority = authority;
  }

  public SchemaIdentity entityType(String entityType) {
    this.entityType = entityType;
    return this;
  }

   /**
   * EntityType Code
   * @return entityType
  **/
  @ApiModelProperty(example = "wellbore", required = true, value = "EntityType Code")
  public String getEntityType() {
    return entityType;
  }

  public void setEntityType(String entityType) {
    this.entityType = entityType;
  }

  public SchemaIdentity id(String id) {
    this.id = id;
    return this;
  }

   /**
   * A read-only system defined id used for referencing of a schema.
   * @return id
  **/
  @ApiModelProperty(example = "osdu:wks:wellbore:1.0.0", value = "A read-only system defined id used for referencing of a schema.")
  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public SchemaIdentity schemaVersionMajor(Integer schemaVersionMajor) {
    this.schemaVersionMajor = schemaVersionMajor;
    return this;
  }

   /**
   * Major Schema Version Number
   * @return schemaVersionMajor
  **/
  @ApiModelProperty(example = "1", required = true, value = "Major Schema Version Number")
  public Integer getSchemaVersionMajor() {
    return schemaVersionMajor;
  }

  public void setSchemaVersionMajor(Integer schemaVersionMajor) {
    this.schemaVersionMajor = schemaVersionMajor;
  }

  public SchemaIdentity schemaVersionMinor(Integer schemaVersionMinor) {
    this.schemaVersionMinor = schemaVersionMinor;
    return this;
  }

   /**
   * Minor Schema Version Number
   * @return schemaVersionMinor
  **/
  @ApiModelProperty(example = "1", required = true, value = "Minor Schema Version Number")
  public Integer getSchemaVersionMinor() {
    return schemaVersionMinor;
  }

  public void setSchemaVersionMinor(Integer schemaVersionMinor) {
    this.schemaVersionMinor = schemaVersionMinor;
  }

  public SchemaIdentity schemaVersionPatch(Integer schemaVersionPatch) {
    this.schemaVersionPatch = schemaVersionPatch;
    return this;
  }

   /**
   * Patch Schema Version Number
   * @return schemaVersionPatch
  **/
  @ApiModelProperty(example = "0", required = true, value = "Patch Schema Version Number")
  public Integer getSchemaVersionPatch() {
    return schemaVersionPatch;
  }

  public void setSchemaVersionPatch(Integer schemaVersionPatch) {
    this.schemaVersionPatch = schemaVersionPatch;
  }

  public SchemaIdentity source(String source) {
    this.source = source;
    return this;
  }

   /**
   * Entity source
   * @return source
  **/
  @ApiModelProperty(example = "wks", required = true, value = "Entity source")
  public String getSource() {
    return source;
  }

  public void setSource(String source) {
    this.source = source;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    SchemaIdentity schemaIdentity = (SchemaIdentity) o;
    return Objects.equals(this.authority, schemaIdentity.authority) &&
        Objects.equals(this.entityType, schemaIdentity.entityType) &&
        Objects.equals(this.id, schemaIdentity.id) &&
        Objects.equals(this.schemaVersionMajor, schemaIdentity.schemaVersionMajor) &&
        Objects.equals(this.schemaVersionMinor, schemaIdentity.schemaVersionMinor) &&
        Objects.equals(this.schemaVersionPatch, schemaIdentity.schemaVersionPatch) &&
        Objects.equals(this.source, schemaIdentity.source);
  }

  @Override
  public int hashCode() {
    return Objects.hash(authority, entityType, id, schemaVersionMajor, schemaVersionMinor, schemaVersionPatch, source);
  }


  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class SchemaIdentity {\n");
    
    sb.append("    authority: ").append(toIndentedString(authority)).append("\n");
    sb.append("    entityType: ").append(toIndentedString(entityType)).append("\n");
    sb.append("    id: ").append(toIndentedString(id)).append("\n");
    sb.append("    schemaVersionMajor: ").append(toIndentedString(schemaVersionMajor)).append("\n");
    sb.append("    schemaVersionMinor: ").append(toIndentedString(schemaVersionMinor)).append("\n");
    sb.append("    schemaVersionPatch: ").append(toIndentedString(schemaVersionPatch)).append("\n");
    sb.append("    source: ").append(toIndentedString(source)).append("\n");
    sb.append("}");
    return sb.toString();
  }

  /**
   * Convert the given object to string with each line indented by 4 spaces
   * (except the first line).
   */
  private String toIndentedString(java.lang.Object o) {
    if (o == null) {
      return "null";
    }
    return o.toString().replace("\n", "\n    ");
  }

}

