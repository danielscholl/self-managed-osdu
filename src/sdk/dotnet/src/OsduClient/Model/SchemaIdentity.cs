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
    /// Schema authority source and type description
    /// </summary>
    [DataContract]
    public partial class SchemaIdentity :  IEquatable<SchemaIdentity>, IValidatableObject
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="SchemaIdentity" /> class.
        /// </summary>
        [JsonConstructorAttribute]
        protected SchemaIdentity() { }
        /// <summary>
        /// Initializes a new instance of the <see cref="SchemaIdentity" /> class.
        /// </summary>
        /// <param name="authority">Entity authority (required).</param>
        /// <param name="entityType">EntityType Code (required).</param>
        /// <param name="id">A read-only system defined id used for referencing of a schema..</param>
        /// <param name="schemaVersionMajor">Major Schema Version Number (required).</param>
        /// <param name="schemaVersionMinor">Minor Schema Version Number (required).</param>
        /// <param name="schemaVersionPatch">Patch Schema Version Number (required).</param>
        /// <param name="source">Entity source (required).</param>
        public SchemaIdentity(string authority = default(string), string entityType = default(string), string id = default(string), int? schemaVersionMajor = default(int?), int? schemaVersionMinor = default(int?), int? schemaVersionPatch = default(int?), string source = default(string))
        {
            // to ensure "authority" is required (not null)
            if (authority == null)
            {
                throw new InvalidDataException("authority is a required property for SchemaIdentity and cannot be null");
            }
            else
            {
                this.Authority = authority;
            }
            // to ensure "entityType" is required (not null)
            if (entityType == null)
            {
                throw new InvalidDataException("entityType is a required property for SchemaIdentity and cannot be null");
            }
            else
            {
                this.EntityType = entityType;
            }
            // to ensure "schemaVersionMajor" is required (not null)
            if (schemaVersionMajor == null)
            {
                throw new InvalidDataException("schemaVersionMajor is a required property for SchemaIdentity and cannot be null");
            }
            else
            {
                this.SchemaVersionMajor = schemaVersionMajor;
            }
            // to ensure "schemaVersionMinor" is required (not null)
            if (schemaVersionMinor == null)
            {
                throw new InvalidDataException("schemaVersionMinor is a required property for SchemaIdentity and cannot be null");
            }
            else
            {
                this.SchemaVersionMinor = schemaVersionMinor;
            }
            // to ensure "schemaVersionPatch" is required (not null)
            if (schemaVersionPatch == null)
            {
                throw new InvalidDataException("schemaVersionPatch is a required property for SchemaIdentity and cannot be null");
            }
            else
            {
                this.SchemaVersionPatch = schemaVersionPatch;
            }
            // to ensure "source" is required (not null)
            if (source == null)
            {
                throw new InvalidDataException("source is a required property for SchemaIdentity and cannot be null");
            }
            else
            {
                this.Source = source;
            }
            this.Id = id;
        }
        
        /// <summary>
        /// Entity authority
        /// </summary>
        /// <value>Entity authority</value>
        [DataMember(Name="authority", EmitDefaultValue=false)]
        public string Authority { get; set; }

        /// <summary>
        /// EntityType Code
        /// </summary>
        /// <value>EntityType Code</value>
        [DataMember(Name="entityType", EmitDefaultValue=false)]
        public string EntityType { get; set; }

        /// <summary>
        /// A read-only system defined id used for referencing of a schema.
        /// </summary>
        /// <value>A read-only system defined id used for referencing of a schema.</value>
        [DataMember(Name="id", EmitDefaultValue=false)]
        public string Id { get; set; }

        /// <summary>
        /// Major Schema Version Number
        /// </summary>
        /// <value>Major Schema Version Number</value>
        [DataMember(Name="schemaVersionMajor", EmitDefaultValue=false)]
        public int? SchemaVersionMajor { get; set; }

        /// <summary>
        /// Minor Schema Version Number
        /// </summary>
        /// <value>Minor Schema Version Number</value>
        [DataMember(Name="schemaVersionMinor", EmitDefaultValue=false)]
        public int? SchemaVersionMinor { get; set; }

        /// <summary>
        /// Patch Schema Version Number
        /// </summary>
        /// <value>Patch Schema Version Number</value>
        [DataMember(Name="schemaVersionPatch", EmitDefaultValue=false)]
        public int? SchemaVersionPatch { get; set; }

        /// <summary>
        /// Entity source
        /// </summary>
        /// <value>Entity source</value>
        [DataMember(Name="source", EmitDefaultValue=false)]
        public string Source { get; set; }

        /// <summary>
        /// Returns the string presentation of the object
        /// </summary>
        /// <returns>String presentation of the object</returns>
        public override string ToString()
        {
            var sb = new StringBuilder();
            sb.Append("class SchemaIdentity {\n");
            sb.Append("  Authority: ").Append(Authority).Append("\n");
            sb.Append("  EntityType: ").Append(EntityType).Append("\n");
            sb.Append("  Id: ").Append(Id).Append("\n");
            sb.Append("  SchemaVersionMajor: ").Append(SchemaVersionMajor).Append("\n");
            sb.Append("  SchemaVersionMinor: ").Append(SchemaVersionMinor).Append("\n");
            sb.Append("  SchemaVersionPatch: ").Append(SchemaVersionPatch).Append("\n");
            sb.Append("  Source: ").Append(Source).Append("\n");
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
            return this.Equals(input as SchemaIdentity);
        }

        /// <summary>
        /// Returns true if SchemaIdentity instances are equal
        /// </summary>
        /// <param name="input">Instance of SchemaIdentity to be compared</param>
        /// <returns>Boolean</returns>
        public bool Equals(SchemaIdentity input)
        {
            if (input == null)
                return false;

            return 
                (
                    this.Authority == input.Authority ||
                    (this.Authority != null &&
                    this.Authority.Equals(input.Authority))
                ) && 
                (
                    this.EntityType == input.EntityType ||
                    (this.EntityType != null &&
                    this.EntityType.Equals(input.EntityType))
                ) && 
                (
                    this.Id == input.Id ||
                    (this.Id != null &&
                    this.Id.Equals(input.Id))
                ) && 
                (
                    this.SchemaVersionMajor == input.SchemaVersionMajor ||
                    (this.SchemaVersionMajor != null &&
                    this.SchemaVersionMajor.Equals(input.SchemaVersionMajor))
                ) && 
                (
                    this.SchemaVersionMinor == input.SchemaVersionMinor ||
                    (this.SchemaVersionMinor != null &&
                    this.SchemaVersionMinor.Equals(input.SchemaVersionMinor))
                ) && 
                (
                    this.SchemaVersionPatch == input.SchemaVersionPatch ||
                    (this.SchemaVersionPatch != null &&
                    this.SchemaVersionPatch.Equals(input.SchemaVersionPatch))
                ) && 
                (
                    this.Source == input.Source ||
                    (this.Source != null &&
                    this.Source.Equals(input.Source))
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
                if (this.Authority != null)
                    hashCode = hashCode * 59 + this.Authority.GetHashCode();
                if (this.EntityType != null)
                    hashCode = hashCode * 59 + this.EntityType.GetHashCode();
                if (this.Id != null)
                    hashCode = hashCode * 59 + this.Id.GetHashCode();
                if (this.SchemaVersionMajor != null)
                    hashCode = hashCode * 59 + this.SchemaVersionMajor.GetHashCode();
                if (this.SchemaVersionMinor != null)
                    hashCode = hashCode * 59 + this.SchemaVersionMinor.GetHashCode();
                if (this.SchemaVersionPatch != null)
                    hashCode = hashCode * 59 + this.SchemaVersionPatch.GetHashCode();
                if (this.Source != null)
                    hashCode = hashCode * 59 + this.Source.GetHashCode();
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
