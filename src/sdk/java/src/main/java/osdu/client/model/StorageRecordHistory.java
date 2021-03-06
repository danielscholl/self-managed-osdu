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
import java.util.ArrayList;
import java.util.List;

/**
 * StorageRecordHistory
 */
@javax.annotation.Generated(value = "io.swagger.codegen.languages.JavaClientCodegen", date = "2022-01-08T01:37:46.955Z")
public class StorageRecordHistory {
  @SerializedName("parents")
  private List<String> parents = null;

  public StorageRecordHistory parents(List<String> parents) {
    this.parents = parents;
    return this;
  }

  public StorageRecordHistory addParentsItem(String parentsItem) {
    if (this.parents == null) {
      this.parents = new ArrayList<String>();
    }
    this.parents.add(parentsItem);
    return this;
  }

   /**
   * List of parent records. Must follow the naming convention: {parent-record-id}:{parent-record-version}.
   * @return parents
  **/
  @ApiModelProperty(value = "List of parent records. Must follow the naming convention: {parent-record-id}:{parent-record-version}.")
  public List<String> getParents() {
    return parents;
  }

  public void setParents(List<String> parents) {
    this.parents = parents;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    StorageRecordHistory storageRecordHistory = (StorageRecordHistory) o;
    return Objects.equals(this.parents, storageRecordHistory.parents);
  }

  @Override
  public int hashCode() {
    return Objects.hash(parents);
  }


  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class StorageRecordHistory {\n");
    
    sb.append("    parents: ").append(toIndentedString(parents)).append("\n");
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

