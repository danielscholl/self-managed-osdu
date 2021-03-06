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
import osdu.client.model.LegalTagDto;

/**
 * Represents a collection of LegalTags.
 */
@ApiModel(description = "Represents a collection of LegalTags.")
@javax.annotation.Generated(value = "io.swagger.codegen.languages.JavaClientCodegen", date = "2022-01-08T01:37:46.955Z")
public class LegalTagDtos {
  @SerializedName("legalTags")
  private List<LegalTagDto> legalTags = null;

  public LegalTagDtos legalTags(List<LegalTagDto> legalTags) {
    this.legalTags = legalTags;
    return this;
  }

  public LegalTagDtos addLegalTagsItem(LegalTagDto legalTagsItem) {
    if (this.legalTags == null) {
      this.legalTags = new ArrayList<LegalTagDto>();
    }
    this.legalTags.add(legalTagsItem);
    return this;
  }

   /**
   * A collection of complete LegalTags
   * @return legalTags
  **/
  @ApiModelProperty(value = "A collection of complete LegalTags")
  public List<LegalTagDto> getLegalTags() {
    return legalTags;
  }

  public void setLegalTags(List<LegalTagDto> legalTags) {
    this.legalTags = legalTags;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    LegalTagDtos legalTagDtos = (LegalTagDtos) o;
    return Objects.equals(this.legalTags, legalTagDtos.legalTags);
  }

  @Override
  public int hashCode() {
    return Objects.hash(legalTags);
  }


  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class LegalTagDtos {\n");
    
    sb.append("    legalTags: ").append(toIndentedString(legalTags)).append("\n");
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

