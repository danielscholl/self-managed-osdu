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
import osdu.client.model.LegalTagProperties;

/**
 * Represents a single LegalTag.
 */
@ApiModel(description = "Represents a single LegalTag.")
@javax.annotation.Generated(value = "io.swagger.codegen.languages.JavaClientCodegen", date = "2022-01-08T01:37:46.955Z")
public class LegalTagDto {
  @SerializedName("name")
  private String name = null;

  @SerializedName("description")
  private String description = null;

  @SerializedName("properties")
  private LegalTagProperties properties = null;

  public LegalTagDto name(String name) {
    this.name = name;
    return this;
  }

   /**
   * The name of the LegalTag.
   * @return name
  **/
  @ApiModelProperty(example = "OSDU-Private-EHCData", value = "The name of the LegalTag.")
  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public LegalTagDto description(String description) {
    this.description = description;
    return this;
  }

   /**
   * The description of the LegalTag.
   * @return description
  **/
  @ApiModelProperty(value = "The description of the LegalTag.")
  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public LegalTagDto properties(LegalTagProperties properties) {
    this.properties = properties;
    return this;
  }

   /**
   * Get properties
   * @return properties
  **/
  @ApiModelProperty(value = "")
  public LegalTagProperties getProperties() {
    return properties;
  }

  public void setProperties(LegalTagProperties properties) {
    this.properties = properties;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    LegalTagDto legalTagDto = (LegalTagDto) o;
    return Objects.equals(this.name, legalTagDto.name) &&
        Objects.equals(this.description, legalTagDto.description) &&
        Objects.equals(this.properties, legalTagDto.properties);
  }

  @Override
  public int hashCode() {
    return Objects.hash(name, description, properties);
  }


  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class LegalTagDto {\n");
    
    sb.append("    name: ").append(toIndentedString(name)).append("\n");
    sb.append("    description: ").append(toIndentedString(description)).append("\n");
    sb.append("    properties: ").append(toIndentedString(properties)).append("\n");
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

