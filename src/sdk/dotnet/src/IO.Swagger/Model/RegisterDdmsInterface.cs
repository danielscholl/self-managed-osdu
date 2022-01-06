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
    /// RegisterDdmsInterface
    /// </summary>
    [DataContract]
    public partial class RegisterDdmsInterface :  IEquatable<RegisterDdmsInterface>, IValidatableObject
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="RegisterDdmsInterface" /> class.
        /// </summary>
        [JsonConstructorAttribute]
        protected RegisterDdmsInterface() { }
        /// <summary>
        /// Initializes a new instance of the <see cref="RegisterDdmsInterface" /> class.
        /// </summary>
        /// <param name="entityType">entityType.</param>
        /// <param name="schema">schema (required).</param>
        public RegisterDdmsInterface(string entityType = default(string), Object schema = default(Object))
        {
            // to ensure "schema" is required (not null)
            if (schema == null)
            {
                throw new InvalidDataException("schema is a required property for RegisterDdmsInterface and cannot be null");
            }
            else
            {
                this.Schema = schema;
            }
            this.EntityType = entityType;
        }
        
        /// <summary>
        /// Gets or Sets EntityType
        /// </summary>
        [DataMember(Name="entityType", EmitDefaultValue=false)]
        public string EntityType { get; set; }

        /// <summary>
        /// Gets or Sets Schema
        /// </summary>
        [DataMember(Name="schema", EmitDefaultValue=false)]
        public Object Schema { get; set; }

        /// <summary>
        /// Returns the string presentation of the object
        /// </summary>
        /// <returns>String presentation of the object</returns>
        public override string ToString()
        {
            var sb = new StringBuilder();
            sb.Append("class RegisterDdmsInterface {\n");
            sb.Append("  EntityType: ").Append(EntityType).Append("\n");
            sb.Append("  Schema: ").Append(Schema).Append("\n");
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
            return this.Equals(input as RegisterDdmsInterface);
        }

        /// <summary>
        /// Returns true if RegisterDdmsInterface instances are equal
        /// </summary>
        /// <param name="input">Instance of RegisterDdmsInterface to be compared</param>
        /// <returns>Boolean</returns>
        public bool Equals(RegisterDdmsInterface input)
        {
            if (input == null)
                return false;

            return 
                (
                    this.EntityType == input.EntityType ||
                    (this.EntityType != null &&
                    this.EntityType.Equals(input.EntityType))
                ) && 
                (
                    this.Schema == input.Schema ||
                    (this.Schema != null &&
                    this.Schema.Equals(input.Schema))
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
                if (this.EntityType != null)
                    hashCode = hashCode * 59 + this.EntityType.GetHashCode();
                if (this.Schema != null)
                    hashCode = hashCode * 59 + this.Schema.GetHashCode();
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
            // EntityType (string) pattern
            Regex regexEntityType = new Regex(@"^[A-Za-z0-9-]{2,50}", RegexOptions.CultureInvariant);
            if (false == regexEntityType.Match(this.EntityType).Success)
            {
                yield return new System.ComponentModel.DataAnnotations.ValidationResult("Invalid value for EntityType, must match a pattern of " + regexEntityType, new [] { "EntityType" });
            }

            yield break;
        }
    }

}