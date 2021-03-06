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
import osdu.client.model.SearchByBoundingBox;
import osdu.client.model.SearchByDistance;
import osdu.client.model.SearchByGeoPolygon;

/**
 * This filter is used to filter geo-point geo data which supports lat/lon pairs. The queries in this group are Geo Distance, Geo Polygon and Bounding Box. Only one spatial criteria can be used while defining filter.
 */
@ApiModel(description = "This filter is used to filter geo-point geo data which supports lat/lon pairs. The queries in this group are Geo Distance, Geo Polygon and Bounding Box. Only one spatial criteria can be used while defining filter.")
@javax.annotation.Generated(value = "io.swagger.codegen.languages.JavaClientCodegen", date = "2022-01-08T01:37:46.955Z")
public class SearchSpatialFilter {
  @SerializedName("field")
  private String field = null;

  @SerializedName("byBoundingBox")
  private SearchByBoundingBox byBoundingBox = null;

  @SerializedName("byDistance")
  private SearchByDistance byDistance = null;

  @SerializedName("byGeoPolygon")
  private SearchByGeoPolygon byGeoPolygon = null;

  public SearchSpatialFilter field(String field) {
    this.field = field;
    return this;
  }

   /**
   * geo-point field in the index on which filtering will be performed.
   * @return field
  **/
  @ApiModelProperty(required = true, value = "geo-point field in the index on which filtering will be performed.")
  public String getField() {
    return field;
  }

  public void setField(String field) {
    this.field = field;
  }

  public SearchSpatialFilter byBoundingBox(SearchByBoundingBox byBoundingBox) {
    this.byBoundingBox = byBoundingBox;
    return this;
  }

   /**
   * Get byBoundingBox
   * @return byBoundingBox
  **/
  @ApiModelProperty(value = "")
  public SearchByBoundingBox getByBoundingBox() {
    return byBoundingBox;
  }

  public void setByBoundingBox(SearchByBoundingBox byBoundingBox) {
    this.byBoundingBox = byBoundingBox;
  }

  public SearchSpatialFilter byDistance(SearchByDistance byDistance) {
    this.byDistance = byDistance;
    return this;
  }

   /**
   * Get byDistance
   * @return byDistance
  **/
  @ApiModelProperty(value = "")
  public SearchByDistance getByDistance() {
    return byDistance;
  }

  public void setByDistance(SearchByDistance byDistance) {
    this.byDistance = byDistance;
  }

  public SearchSpatialFilter byGeoPolygon(SearchByGeoPolygon byGeoPolygon) {
    this.byGeoPolygon = byGeoPolygon;
    return this;
  }

   /**
   * Get byGeoPolygon
   * @return byGeoPolygon
  **/
  @ApiModelProperty(value = "")
  public SearchByGeoPolygon getByGeoPolygon() {
    return byGeoPolygon;
  }

  public void setByGeoPolygon(SearchByGeoPolygon byGeoPolygon) {
    this.byGeoPolygon = byGeoPolygon;
  }


  @Override
  public boolean equals(java.lang.Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    SearchSpatialFilter searchSpatialFilter = (SearchSpatialFilter) o;
    return Objects.equals(this.field, searchSpatialFilter.field) &&
        Objects.equals(this.byBoundingBox, searchSpatialFilter.byBoundingBox) &&
        Objects.equals(this.byDistance, searchSpatialFilter.byDistance) &&
        Objects.equals(this.byGeoPolygon, searchSpatialFilter.byGeoPolygon);
  }

  @Override
  public int hashCode() {
    return Objects.hash(field, byBoundingBox, byDistance, byGeoPolygon);
  }


  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class SearchSpatialFilter {\n");
    
    sb.append("    field: ").append(toIndentedString(field)).append("\n");
    sb.append("    byBoundingBox: ").append(toIndentedString(byBoundingBox)).append("\n");
    sb.append("    byDistance: ").append(toIndentedString(byDistance)).append("\n");
    sb.append("    byGeoPolygon: ").append(toIndentedString(byGeoPolygon)).append("\n");
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

