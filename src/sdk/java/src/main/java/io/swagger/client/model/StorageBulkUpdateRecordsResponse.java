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
import java.util.ArrayList;
import java.util.List;

/**
 * Result of the record batch update request.
 */
@ApiModel(description = "Result of the record batch update request.")
@javax.annotation.Generated(value = "io.swagger.codegen.languages.JavaClientCodegen", date = "2022-01-06T19:55:22.158Z")
public class StorageBulkUpdateRecordsResponse {
  @SerializedName("recordCount")
  private Integer recordCount = null;

  @SerializedName("recordIds")
  private List<String> recordIds = null;

  @SerializedName("notFoundRecordIds")
  private List<String> notFoundRecordIds = null;

  @SerializedName("unAuthorizedRecordIds")
  private List<String> unAuthorizedRecordIds = null;

  @SerializedName("lockedRecordIds")
  private List<String> lockedRecordIds = null;

  public StorageBulkUpdateRecordsResponse recordCount(Integer recordCount) {
    this.recordCount = recordCount;
    return this;
  }

   /**
   * Number of records which updated successfully.
   * @return recordCount
  **/
  @ApiModelProperty(value = "Number of records which updated successfully.")
  public Integer getRecordCount() {
    return recordCount;
  }

  public void setRecordCount(Integer recordCount) {
    this.recordCount = recordCount;
  }

  public StorageBulkUpdateRecordsResponse recordIds(List<String> recordIds) {
    this.recordIds = recordIds;
    return this;
  }

  public StorageBulkUpdateRecordsResponse addRecordIdsItem(String recordIdsItem) {
    if (this.recordIds == null) {
      this.recordIds = new ArrayList<String>();
    }
    this.recordIds.add(recordIdsItem);
    return this;
  }

   /**
   * List of successfully updated record ids.
   * @return recordIds
  **/
  @ApiModelProperty(value = "List of successfully updated record ids.")
  public List<String> getRecordIds() {
    return recordIds;
  }

  public void setRecordIds(List<String> recordIds) {
    this.recordIds = recordIds;
  }

  public StorageBulkUpdateRecordsResponse notFoundRecordIds(List<String> notFoundRecordIds) {
    this.notFoundRecordIds = notFoundRecordIds;
    return this;
  }

  public StorageBulkUpdateRecordsResponse addNotFoundRecordIdsItem(String notFoundRecordIdsItem) {
    if (this.notFoundRecordIds == null) {
      this.notFoundRecordIds = new ArrayList<String>();
    }
    this.notFoundRecordIds.add(notFoundRecordIdsItem);
    return this;
  }

   /**
   * List of record ids for whom RecordMetadata was not found
   * @return notFoundRecordIds
  **/
  @ApiModelProperty(value = "List of record ids for whom RecordMetadata was not found")
  public List<String> getNotFoundRecordIds() {
    return notFoundRecordIds;
  }

  public void setNotFoundRecordIds(List<String> notFoundRecordIds) {
    this.notFoundRecordIds = notFoundRecordIds;
  }

  public StorageBulkUpdateRecordsResponse unAuthorizedRecordIds(List<String> unAuthorizedRecordIds) {
    this.unAuthorizedRecordIds = unAuthorizedRecordIds;
    return this;
  }

  public StorageBulkUpdateRecordsResponse addUnAuthorizedRecordIdsItem(String unAuthorizedRecordIdsItem) {
    if (this.unAuthorizedRecordIds == null) {
      this.unAuthorizedRecordIds = new ArrayList<String>();
    }
    this.unAuthorizedRecordIds.add(unAuthorizedRecordIdsItem);
    return this;
  }

   /**
   * List of record ids for whom user does not has owner permissions
   * @return unAuthorizedRecordIds
  **/
  @ApiModelProperty(value = "List of record ids for whom user does not has owner permissions")
  public List<String> getUnAuthorizedRecordIds() {
    return unAuthorizedRecordIds;
  }

  public void setUnAuthorizedRecordIds(List<String> unAuthorizedRecordIds) {
    this.unAuthorizedRecordIds = unAuthorizedRecordIds;
  }

  public StorageBulkUpdateRecordsResponse lockedRecordIds(List<String> lockedRecordIds) {
    this.lockedRecordIds = lockedRecordIds;
    return this;
  }

  public StorageBulkUpdateRecordsResponse addLockedRecordIdsItem(String lockedRecordIdsItem) {
    if (this.lockedRecordIds == null) {
      this.lockedRecordIds = new ArrayList<String>();
    }
    this.lockedRecordIds.add(lockedRecordIdsItem);
    return this;
  }

   /**
   * List of locked record ids
   * @return lockedRecordIds
  **/
  @ApiModelProperty(value = "List of locked record ids")
  public List<String> getLockedRecordIds() {
    return lockedRecordIds;
  }

  public void setLockedRecordIds(List<String> lockedRecordIds) {
    this.lockedRecordIds = lockedRecordIds;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    StorageBulkUpdateRecordsResponse storageBulkUpdateRecordsResponse = (StorageBulkUpdateRecordsResponse) o;
    return Objects.equals(this.recordCount, storageBulkUpdateRecordsResponse.recordCount) &&
        Objects.equals(this.recordIds, storageBulkUpdateRecordsResponse.recordIds) &&
        Objects.equals(this.notFoundRecordIds, storageBulkUpdateRecordsResponse.notFoundRecordIds) &&
        Objects.equals(this.unAuthorizedRecordIds, storageBulkUpdateRecordsResponse.unAuthorizedRecordIds) &&
        Objects.equals(this.lockedRecordIds, storageBulkUpdateRecordsResponse.lockedRecordIds);
  }

  @Override
  public int hashCode() {
    return Objects.hash(recordCount, recordIds, notFoundRecordIds, unAuthorizedRecordIds, lockedRecordIds);
  }


  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class StorageBulkUpdateRecordsResponse {\n");
    
    sb.append("    recordCount: ").append(toIndentedString(recordCount)).append("\n");
    sb.append("    recordIds: ").append(toIndentedString(recordIds)).append("\n");
    sb.append("    notFoundRecordIds: ").append(toIndentedString(notFoundRecordIds)).append("\n");
    sb.append("    unAuthorizedRecordIds: ").append(toIndentedString(unAuthorizedRecordIds)).append("\n");
    sb.append("    lockedRecordIds: ").append(toIndentedString(lockedRecordIds)).append("\n");
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

