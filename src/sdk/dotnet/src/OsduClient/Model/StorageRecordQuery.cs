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
    /// Patch api query specific information
    /// </summary>
    [DataContract]
    public partial class StorageRecordQuery :  IEquatable<StorageRecordQuery>, IValidatableObject
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="StorageRecordQuery" /> class.
        /// </summary>
        [JsonConstructorAttribute]
        protected StorageRecordQuery() { }
        /// <summary>
        /// Initializes a new instance of the <see cref="StorageRecordQuery" /> class.
        /// </summary>
        /// <param name="ids">Records ids for whom patch operations going to be applied (required).</param>
        public StorageRecordQuery(List<string> ids = default(List<string>))
        {
            // to ensure "ids" is required (not null)
            if (ids == null)
            {
                throw new InvalidDataException("ids is a required property for StorageRecordQuery and cannot be null");
            }
            else
            {
                this.Ids = ids;
            }
        }
        
        /// <summary>
        /// Records ids for whom patch operations going to be applied
        /// </summary>
        /// <value>Records ids for whom patch operations going to be applied</value>
        [DataMember(Name="ids", EmitDefaultValue=false)]
        public List<string> Ids { get; set; }

        /// <summary>
        /// Returns the string presentation of the object
        /// </summary>
        /// <returns>String presentation of the object</returns>
        public override string ToString()
        {
            var sb = new StringBuilder();
            sb.Append("class StorageRecordQuery {\n");
            sb.Append("  Ids: ").Append(Ids).Append("\n");
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
            return this.Equals(input as StorageRecordQuery);
        }

        /// <summary>
        /// Returns true if StorageRecordQuery instances are equal
        /// </summary>
        /// <param name="input">Instance of StorageRecordQuery to be compared</param>
        /// <returns>Boolean</returns>
        public bool Equals(StorageRecordQuery input)
        {
            if (input == null)
                return false;

            return 
                (
                    this.Ids == input.Ids ||
                    this.Ids != null &&
                    this.Ids.SequenceEqual(input.Ids)
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
                if (this.Ids != null)
                    hashCode = hashCode * 59 + this.Ids.GetHashCode();
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
            yield break;
        }
    }

}
