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


package osdu.client.model;

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
import osdu.client.model.FileToManyRelationship;
import osdu.client.model.FileToOneRelationship;

/**
 * All relationships from this entity.
 */
@ApiModel(description = "All relationships from this entity.")
@javax.annotation.Generated(value = "io.swagger.codegen.languages.JavaClientCodegen", date = "2022-01-08T01:37:46.955Z")
public class FileRelationships {
  @SerializedName("parentEntity")
  private FileToOneRelationship parentEntity = null;

  @SerializedName("relatedItems")
  private FileToManyRelationship relatedItems = null;

  public FileRelationships parentEntity(FileToOneRelationship parentEntity) {
    this.parentEntity = parentEntity;
    return this;
  }

   /**
   * Get parentEntity
   * @return parentEntity
  **/
  @ApiModelProperty(value = "")
  public FileToOneRelationship getParentEntity() {
    return parentEntity;
  }

  public void setParentEntity(FileToOneRelationship parentEntity) {
    this.parentEntity = parentEntity;
  }

  public FileRelationships relatedItems(FileToManyRelationship relatedItems) {
    this.relatedItems = relatedItems;
    return this;
  }

   /**
   * Get relatedItems
   * @return relatedItems
  **/
  @ApiModelProperty(value = "")
  public FileToManyRelationship getRelatedItems() {
    return relatedItems;
  }

  public void setRelatedItems(FileToManyRelationship relatedItems) {
    this.relatedItems = relatedItems;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    FileRelationships fileRelationships = (FileRelationships) o;
    return Objects.equals(this.parentEntity, fileRelationships.parentEntity) &&
        Objects.equals(this.relatedItems, fileRelationships.relatedItems);
  }

  @Override
  public int hashCode() {
    return Objects.hash(parentEntity, relatedItems);
  }


  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class FileRelationships {\n");
    
    sb.append("    parentEntity: ").append(toIndentedString(parentEntity)).append("\n");
    sb.append("    relatedItems: ").append(toIndentedString(relatedItems)).append("\n");
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

