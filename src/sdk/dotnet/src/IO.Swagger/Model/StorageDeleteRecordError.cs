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
using SwaggerDateConverter = IO.Swagger.Client.SwaggerDateConverter;

namespace IO.Swagger.Model
{
    /// <summary>
    /// Delete Records Response Body
    /// </summary>
    [DataContract]
    public partial class StorageDeleteRecordError :  IEquatable<StorageDeleteRecordError>, IValidatableObject
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="StorageDeleteRecordError" /> class.
        /// </summary>
        /// <param name="notDeletedRecordId">Record id which wasn&#39;t deleted successfully..</param>
        /// <param name="message">Brief description of the cause why record wasn&#39;t delete.</param>
        public StorageDeleteRecordError(string notDeletedRecordId = default(string), string message = default(string))
        {
            this.NotDeletedRecordId = notDeletedRecordId;
            this.Message = message;
        }
        
        /// <summary>
        /// Record id which wasn&#39;t deleted successfully.
        /// </summary>
        /// <value>Record id which wasn&#39;t deleted successfully.</value>
        [DataMember(Name="notDeletedRecordId", EmitDefaultValue=false)]
        public string NotDeletedRecordId { get; set; }

        /// <summary>
        /// Brief description of the cause why record wasn&#39;t delete
        /// </summary>
        /// <value>Brief description of the cause why record wasn&#39;t delete</value>
        [DataMember(Name="message", EmitDefaultValue=false)]
        public string Message { get; set; }

        /// <summary>
        /// Returns the string presentation of the object
        /// </summary>
        /// <returns>String presentation of the object</returns>
        public override string ToString()
        {
            var sb = new StringBuilder();
            sb.Append("class StorageDeleteRecordError {\n");
            sb.Append("  NotDeletedRecordId: ").Append(NotDeletedRecordId).Append("\n");
            sb.Append("  Message: ").Append(Message).Append("\n");
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
            return this.Equals(input as StorageDeleteRecordError);
        }

        /// <summary>
        /// Returns true if StorageDeleteRecordError instances are equal
        /// </summary>
        /// <param name="input">Instance of StorageDeleteRecordError to be compared</param>
        /// <returns>Boolean</returns>
        public bool Equals(StorageDeleteRecordError input)
        {
            if (input == null)
                return false;

            return 
                (
                    this.NotDeletedRecordId == input.NotDeletedRecordId ||
                    (this.NotDeletedRecordId != null &&
                    this.NotDeletedRecordId.Equals(input.NotDeletedRecordId))
                ) && 
                (
                    this.Message == input.Message ||
                    (this.Message != null &&
                    this.Message.Equals(input.Message))
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
                if (this.NotDeletedRecordId != null)
                    hashCode = hashCode * 59 + this.NotDeletedRecordId.GetHashCode();
                if (this.Message != null)
                    hashCode = hashCode * 59 + this.Message.GetHashCode();
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