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
    /// Represents a collection of LegalTags.
    /// </summary>
    [DataContract]
    public partial class LegalTagDtos :  IEquatable<LegalTagDtos>, IValidatableObject
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="LegalTagDtos" /> class.
        /// </summary>
        /// <param name="legalTags">A collection of complete LegalTags.</param>
        public LegalTagDtos(List<LegalTagDto> legalTags = default(List<LegalTagDto>))
        {
            this.LegalTags = legalTags;
        }
        
        /// <summary>
        /// A collection of complete LegalTags
        /// </summary>
        /// <value>A collection of complete LegalTags</value>
        [DataMember(Name="legalTags", EmitDefaultValue=false)]
        public List<LegalTagDto> LegalTags { get; set; }

        /// <summary>
        /// Returns the string presentation of the object
        /// </summary>
        /// <returns>String presentation of the object</returns>
        public override string ToString()
        {
            var sb = new StringBuilder();
            sb.Append("class LegalTagDtos {\n");
            sb.Append("  LegalTags: ").Append(LegalTags).Append("\n");
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
            return this.Equals(input as LegalTagDtos);
        }

        /// <summary>
        /// Returns true if LegalTagDtos instances are equal
        /// </summary>
        /// <param name="input">Instance of LegalTagDtos to be compared</param>
        /// <returns>Boolean</returns>
        public bool Equals(LegalTagDtos input)
        {
            if (input == null)
                return false;

            return 
                (
                    this.LegalTags == input.LegalTags ||
                    this.LegalTags != null &&
                    this.LegalTags.SequenceEqual(input.LegalTags)
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
                if (this.LegalTags != null)
                    hashCode = hashCode * 59 + this.LegalTags.GetHashCode();
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
