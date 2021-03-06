/* 
 * self-managed-osdu
 *
 * Rest API Documentation for Self Managed OSDU
 *
 * OpenAPI spec version: 0.11.0
 * 
 * Generated by: https://github.com/swagger-api/swagger-codegen.git
 */

using System;
using System.Linq;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Runtime.Serialization;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System.ComponentModel.DataAnnotations;
using SwaggerDateConverter = OsduClient.Client.SwaggerDateConverter;

namespace OsduClient.Model
{
    /// <summary>
    /// Json object to query the Search API
    /// </summary>
    [DataContract]
    public partial class SearchCursorQueryRequest :  IEquatable<SearchCursorQueryRequest>, IValidatableObject
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="SearchCursorQueryRequest" /> class.
        /// </summary>
        [JsonConstructorAttribute]
        protected SearchCursorQueryRequest() { }
        /// <summary>
        /// Initializes a new instance of the <see cref="SearchCursorQueryRequest" /> class.
        /// </summary>
        /// <param name="cursor">The cursor value returned from a previous query..</param>
        /// <param name="kind">The kind of the record to query e.g. &#39;tenant1:test:well:1.0.0&#39;. (required).</param>
        /// <param name="limit">The maximum number of results to return from the given offset. If no limit is provided, then it will return 10 items. Max number of items which can be fetched by the query is 1000..</param>
        /// <param name="query">The query string in Lucene query string syntax..</param>
        /// <param name="spatialFilter">spatialFilter.</param>
        /// <param name="returnedFields">The fields on which to project the results..</param>
        public SearchCursorQueryRequest(string cursor = default(string), string kind = default(string), int? limit = default(int?), string query = default(string), SearchSpatialFilter spatialFilter = default(SearchSpatialFilter), List<string> returnedFields = default(List<string>))
        {
            // to ensure "kind" is required (not null)
            if (kind == null)
            {
                throw new InvalidDataException("kind is a required property for SearchCursorQueryRequest and cannot be null");
            }
            else
            {
                this.Kind = kind;
            }
            this.Cursor = cursor;
            this.Limit = limit;
            this.Query = query;
            this.SpatialFilter = spatialFilter;
            this.ReturnedFields = returnedFields;
        }
        
        /// <summary>
        /// The cursor value returned from a previous query.
        /// </summary>
        /// <value>The cursor value returned from a previous query.</value>
        [DataMember(Name="cursor", EmitDefaultValue=false)]
        public string Cursor { get; set; }

        /// <summary>
        /// The kind of the record to query e.g. &#39;tenant1:test:well:1.0.0&#39;.
        /// </summary>
        /// <value>The kind of the record to query e.g. &#39;tenant1:test:well:1.0.0&#39;.</value>
        [DataMember(Name="kind", EmitDefaultValue=false)]
        public string Kind { get; set; }

        /// <summary>
        /// The maximum number of results to return from the given offset. If no limit is provided, then it will return 10 items. Max number of items which can be fetched by the query is 1000.
        /// </summary>
        /// <value>The maximum number of results to return from the given offset. If no limit is provided, then it will return 10 items. Max number of items which can be fetched by the query is 1000.</value>
        [DataMember(Name="limit", EmitDefaultValue=false)]
        public int? Limit { get; set; }

        /// <summary>
        /// The query string in Lucene query string syntax.
        /// </summary>
        /// <value>The query string in Lucene query string syntax.</value>
        [DataMember(Name="query", EmitDefaultValue=false)]
        public string Query { get; set; }

        /// <summary>
        /// Gets or Sets SpatialFilter
        /// </summary>
        [DataMember(Name="spatialFilter", EmitDefaultValue=false)]
        public SearchSpatialFilter SpatialFilter { get; set; }

        /// <summary>
        /// The fields on which to project the results.
        /// </summary>
        /// <value>The fields on which to project the results.</value>
        [DataMember(Name="returnedFields", EmitDefaultValue=false)]
        public List<string> ReturnedFields { get; set; }

        /// <summary>
        /// Returns the string presentation of the object
        /// </summary>
        /// <returns>String presentation of the object</returns>
        public override string ToString()
        {
            var sb = new StringBuilder();
            sb.Append("class SearchCursorQueryRequest {\n");
            sb.Append("  Cursor: ").Append(Cursor).Append("\n");
            sb.Append("  Kind: ").Append(Kind).Append("\n");
            sb.Append("  Limit: ").Append(Limit).Append("\n");
            sb.Append("  Query: ").Append(Query).Append("\n");
            sb.Append("  SpatialFilter: ").Append(SpatialFilter).Append("\n");
            sb.Append("  ReturnedFields: ").Append(ReturnedFields).Append("\n");
            sb.Append("}\n");
            return sb.ToString();
        }
  
        /// <summary>
        /// Returns the JSON string presentation of the object
        /// </summary>
        /// <returns>JSON string presentation of the object</returns>
        public virtual string ToJson()
        {
            return JsonConvert.SerializeObject(this, Formatting.Indented);
        }

        /// <summary>
        /// Returns true if objects are equal
        /// </summary>
        /// <param name="input">Object to be compared</param>
        /// <returns>Boolean</returns>
        public override bool Equals(object input)
        {
            return this.Equals(input as SearchCursorQueryRequest);
        }

        /// <summary>
        /// Returns true if SearchCursorQueryRequest instances are equal
        /// </summary>
        /// <param name="input">Instance of SearchCursorQueryRequest to be compared</param>
        /// <returns>Boolean</returns>
        public bool Equals(SearchCursorQueryRequest input)
        {
            if (input == null)
                return false;

            return 
                (
                    this.Cursor == input.Cursor ||
                    (this.Cursor != null &&
                    this.Cursor.Equals(input.Cursor))
                ) && 
                (
                    this.Kind == input.Kind ||
                    (this.Kind != null &&
                    this.Kind.Equals(input.Kind))
                ) && 
                (
                    this.Limit == input.Limit ||
                    (this.Limit != null &&
                    this.Limit.Equals(input.Limit))
                ) && 
                (
                    this.Query == input.Query ||
                    (this.Query != null &&
                    this.Query.Equals(input.Query))
                ) && 
                (
                    this.SpatialFilter == input.SpatialFilter ||
                    (this.SpatialFilter != null &&
                    this.SpatialFilter.Equals(input.SpatialFilter))
                ) && 
                (
                    this.ReturnedFields == input.ReturnedFields ||
                    this.ReturnedFields != null &&
                    this.ReturnedFields.SequenceEqual(input.ReturnedFields)
                );
        }

        /// <summary>
        /// Gets the hash code
        /// </summary>
        /// <returns>Hash code</returns>
        public override int GetHashCode()
        {
            unchecked // Overflow is fine, just wrap
            {
                int hashCode = 41;
                if (this.Cursor != null)
                    hashCode = hashCode * 59 + this.Cursor.GetHashCode();
                if (this.Kind != null)
                    hashCode = hashCode * 59 + this.Kind.GetHashCode();
                if (this.Limit != null)
                    hashCode = hashCode * 59 + this.Limit.GetHashCode();
                if (this.Query != null)
                    hashCode = hashCode * 59 + this.Query.GetHashCode();
                if (this.SpatialFilter != null)
                    hashCode = hashCode * 59 + this.SpatialFilter.GetHashCode();
                if (this.ReturnedFields != null)
                    hashCode = hashCode * 59 + this.ReturnedFields.GetHashCode();
                return hashCode;
            }
        }

        /// <summary>
        /// To validate all properties of the instance
        /// </summary>
        /// <param name="validationContext">Validation context</param>
        /// <returns>Validation Result</returns>
        IEnumerable<System.ComponentModel.DataAnnotations.ValidationResult> IValidatableObject.Validate(ValidationContext validationContext)
        {
            // Limit (int?) minimum
            if(this.Limit < (int?)0)
            {
                yield return new System.ComponentModel.DataAnnotations.ValidationResult("Invalid value for Limit, must be a value greater than or equal to 0.", new [] { "Limit" });
            }

            yield break;
        }
    }

}
