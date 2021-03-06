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

/**
 * The file data container containing all necessary details of the file record
 */
@ApiModel(description = "The file data container containing all necessary details of the file record")
@javax.annotation.Generated(value = "io.swagger.codegen.languages.JavaClientCodegen", date = "2022-01-08T01:37:46.955Z")
public class Files {
  @SerializedName("Name")
  private String name = null;

  @SerializedName("Description")
  private String description = null;

  @SerializedName("TotalSize")
  private String totalSize = null;

  @SerializedName("EncodingFormatTypeID")
  private String encodingFormatTypeID = null;

  @SerializedName("SchemaFormatTypeID")
  private String schemaFormatTypeID = null;

  /**
   * Endianness of binary value. Enumeration- \\BIG\\ \\LITTLE\\.  If absent applications will need to interpret from context indicators.
   */
  @JsonAdapter(EndianEnum.Adapter.class)
  public enum EndianEnum {
    BIG_LITTLE("BIG LITTLE");

    private String value;

    EndianEnum(String value) {
      this.value = value;
    }

    public String getValue() {
      return value;
    }

    @Override
    public String toString() {
      return String.valueOf(value);
    }

    public static EndianEnum fromValue(String text) {
      for (EndianEnum b : EndianEnum.values()) {
        if (String.valueOf(b.value).equals(text)) {
          return b;
        }
      }
      return null;
    }

    public static class Adapter extends TypeAdapter<EndianEnum> {
      @Override
      public void write(final JsonWriter jsonWriter, final EndianEnum enumeration) throws IOException {
        jsonWriter.value(enumeration.getValue());
      }

      @Override
      public EndianEnum read(final JsonReader jsonReader) throws IOException {
        String value = jsonReader.nextString();
        return EndianEnum.fromValue(String.valueOf(value));
      }
    }
  }

  @SerializedName("Endian")
  private EndianEnum endian = null;

  @SerializedName("Checksum")
  private String checksum = null;

  @SerializedName("DatasetProperties")
  private Object datasetProperties = null;

  @SerializedName("ExtensionProperties")
  private Object extensionProperties = null;

  public Files name(String name) {
    this.name = name;
    return this;
  }

   /**
   * An optional name of the dataset, e.g. a user friendly file or file collection name.
   * @return name
  **/
  @ApiModelProperty(required = true, value = "An optional name of the dataset, e.g. a user friendly file or file collection name.")
  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Files description(String description) {
    this.description = description;
    return this;
  }

   /**
   * An optional, textual description of the dataset.
   * @return description
  **/
  @ApiModelProperty(value = "An optional, textual description of the dataset.")
  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public Files totalSize(String totalSize) {
    this.totalSize = totalSize;
    return this;
  }

   /**
   * Total size of the dataset in bytes; for files it is the same as declared in FileSourceInfo.FileSize or the sum of all individual files. Implemented as string. The value must be convertible to a long integer (sizes can become very large).
   * @return totalSize
  **/
  @ApiModelProperty(value = "Total size of the dataset in bytes; for files it is the same as declared in FileSourceInfo.FileSize or the sum of all individual files. Implemented as string. The value must be convertible to a long integer (sizes can become very large).")
  public String getTotalSize() {
    return totalSize;
  }

  public void setTotalSize(String totalSize) {
    this.totalSize = totalSize;
  }

  public Files encodingFormatTypeID(String encodingFormatTypeID) {
    this.encodingFormatTypeID = encodingFormatTypeID;
    return this;
  }

   /**
   * Encoding Format Type ID
   * @return encodingFormatTypeID
  **/
  @ApiModelProperty(value = "Encoding Format Type ID")
  public String getEncodingFormatTypeID() {
    return encodingFormatTypeID;
  }

  public void setEncodingFormatTypeID(String encodingFormatTypeID) {
    this.encodingFormatTypeID = encodingFormatTypeID;
  }

  public Files schemaFormatTypeID(String schemaFormatTypeID) {
    this.schemaFormatTypeID = schemaFormatTypeID;
    return this;
  }

   /**
   * Schema Format Type ID
   * @return schemaFormatTypeID
  **/
  @ApiModelProperty(value = "Schema Format Type ID")
  public String getSchemaFormatTypeID() {
    return schemaFormatTypeID;
  }

  public void setSchemaFormatTypeID(String schemaFormatTypeID) {
    this.schemaFormatTypeID = schemaFormatTypeID;
  }

  public Files endian(EndianEnum endian) {
    this.endian = endian;
    return this;
  }

   /**
   * Endianness of binary value. Enumeration- \\BIG\\ \\LITTLE\\.  If absent applications will need to interpret from context indicators.
   * @return endian
  **/
  @ApiModelProperty(required = true, value = "Endianness of binary value. Enumeration- \\BIG\\ \\LITTLE\\.  If absent applications will need to interpret from context indicators.")
  public EndianEnum getEndian() {
    return endian;
  }

  public void setEndian(EndianEnum endian) {
    this.endian = endian;
  }

  public Files checksum(String checksum) {
    this.checksum = checksum;
    return this;
  }

   /**
   * MD5 checksum of file bytes - a 32 byte hexadecimal number
   * @return checksum
  **/
  @ApiModelProperty(value = "MD5 checksum of file bytes - a 32 byte hexadecimal number")
  public String getChecksum() {
    return checksum;
  }

  public void setChecksum(String checksum) {
    this.checksum = checksum;
  }

  public Files datasetProperties(Object datasetProperties) {
    this.datasetProperties = datasetProperties;
    return this;
  }

   /**
   * Get datasetProperties
   * @return datasetProperties
  **/
  @ApiModelProperty(required = true, value = "")
  public Object getDatasetProperties() {
    return datasetProperties;
  }

  public void setDatasetProperties(Object datasetProperties) {
    this.datasetProperties = datasetProperties;
  }

  public Files extensionProperties(Object extensionProperties) {
    this.extensionProperties = extensionProperties;
    return this;
  }

   /**
   * Get extensionProperties
   * @return extensionProperties
  **/
  @ApiModelProperty(value = "")
  public Object getExtensionProperties() {
    return extensionProperties;
  }

  public void setExtensionProperties(Object extensionProperties) {
    this.extensionProperties = extensionProperties;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Files files = (Files) o;
    return Objects.equals(this.name, files.name) &&
        Objects.equals(this.description, files.description) &&
        Objects.equals(this.totalSize, files.totalSize) &&
        Objects.equals(this.encodingFormatTypeID, files.encodingFormatTypeID) &&
        Objects.equals(this.schemaFormatTypeID, files.schemaFormatTypeID) &&
        Objects.equals(this.endian, files.endian) &&
        Objects.equals(this.checksum, files.checksum) &&
        Objects.equals(this.datasetProperties, files.datasetProperties) &&
        Objects.equals(this.extensionProperties, files.extensionProperties);
  }

  @Override
  public int hashCode() {
    return Objects.hash(name, description, totalSize, encodingFormatTypeID, schemaFormatTypeID, endian, checksum, datasetProperties, extensionProperties);
  }


  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class Files {\n");
    
    sb.append("    name: ").append(toIndentedString(name)).append("\n");
    sb.append("    description: ").append(toIndentedString(description)).append("\n");
    sb.append("    totalSize: ").append(toIndentedString(totalSize)).append("\n");
    sb.append("    encodingFormatTypeID: ").append(toIndentedString(encodingFormatTypeID)).append("\n");
    sb.append("    schemaFormatTypeID: ").append(toIndentedString(schemaFormatTypeID)).append("\n");
    sb.append("    endian: ").append(toIndentedString(endian)).append("\n");
    sb.append("    checksum: ").append(toIndentedString(checksum)).append("\n");
    sb.append("    datasetProperties: ").append(toIndentedString(datasetProperties)).append("\n");
    sb.append("    extensionProperties: ").append(toIndentedString(extensionProperties)).append("\n");
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

