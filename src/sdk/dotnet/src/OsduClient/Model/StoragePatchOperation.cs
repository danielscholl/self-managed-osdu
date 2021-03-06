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
    /// Patch api operation specific information
    /// </summary>
    [DataContract]
    public partial class StoragePatchOperation :  IEquatable<StoragePatchOperation>, IValidatableObject
    {
        /// <summary>
        /// Type of patch operation
        /// </summary>
        /// <value>Type of patch operation</value>
        [JsonConverter(typeof(StringEnumConverter))]
        public enum OpEnum
        {
            
            /// <summary>
            /// Enum Add for value: add
            /// </summary>
            [EnumMember(Value = "add")]
            Add = 1,
            
            /// <summary>
            /// Enum Replace for value: replace
            /// </summary>
            [EnumMember(Value = "replace")]
            Replace = 2,
            
            /// <summary>
            /// Enum Remove for value: remove
            /// </summary>
            [EnumMember(Value = "remove")]
            Remove = 3
        }

        /// <summary>
        /// Type of patch operation
        /// </summary>
        /// <value>Type of patch operation</value>
        [DataMember(Name="op", EmitDefaultValue=false)]
        public OpEnum Op { get; set; }
        /// <summary>
        /// Initializes a new instance of the <see cref="StoragePatchOperation" /> class.
        /// </summary>
        [JsonConstructorAttribute]
        protected StoragePatchOperation() { }
        /// <summary>
        /// Initializes a new instance of the <see cref="StoragePatchOperation" /> class.
        /// </summary>
        /// <param name="op">Type of patch operation (required).</param>
        /// <param name="path">Path for batch operation (required).</param>
        /// <param name="value">Path for batch operation (required).</param>
        public StoragePatchOperation(OpEnum op = default(OpEnum), string path = default(string), List<string> value = default(List<string>))
        {
            // to ensure "op" is required (not null)
            if (op == null)
            {
                throw new InvalidDataException("op is a required property for StoragePatchOperation and cannot be null");
            }
            else
            {
                this.Op = op;
            }
            // to ensure "path" is required (not null)
            if (path == null)
            {
                throw new InvalidDataException("path is a required property for StoragePatchOperation and cannot be null");
            }
            else
            {
                this.Path = path;
            }
            // to ensure "value" is required (not null)
            if (value == null)
            {
                throw new InvalidDataException("value is a required property for StoragePatchOperation and cannot be null");
            }
            else
            {
                this.Value = value;
            }
        }
        

        /// <summary>
        /// Path for batch operation
        /// </summary>
        /// <value>Path for batch operation</value>
        [DataMember(Name="path", EmitDefaultValue=false)]
        public string Path { get; set; }

        /// <summary>
        /// Path for batch operation
        /// </summary>
        /// <value>Path for batch operation</value>
        [DataMember(Name="value", EmitDefaultValue=false)]
        public List<string> Value { get; set; }

        /// <summary>
        /// Returns the string presentation of the object
        /// </summary>
        /// <returns>String presentation of the object</returns>
        public override string ToString()
        {
            var sb = new StringBuilder();
            sb.Append("class StoragePatchOperation {\n");
            sb.Append("  Op: ").Append(Op).Append("\n");
            sb.Append("  Path: ").Append(Path).Append("\n");
            sb.Append("  Value: ").Append(Value).Append("\n");
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
            return this.Equals(input as StoragePatchOperation);
        }

        /// <summary>
        /// Returns true if StoragePatchOperation instances are equal
        /// </summary>
        /// <param name="input">Instance of StoragePatchOperation to be compared</param>
        /// <returns>Boolean</returns>
        public bool Equals(StoragePatchOperation input)
        {
            if (input == null)
                return false;

            return 
                (
                    this.Op == input.Op ||
                    (this.Op != null &&
                    this.Op.Equals(input.Op))
                ) && 
                (
                    this.Path == input.Path ||
                    (this.Path != null &&
                    this.Path.Equals(input.Path))
                ) && 
                (
                    this.Value == input.Value ||
                    this.Value != null &&
                    this.Value.SequenceEqual(input.Value)
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
                if (this.Op != null)
                    hashCode = hashCode * 59 + this.Op.GetHashCode();
                if (this.Path != null)
                    hashCode = hashCode * 59 + this.Path.GetHashCode();
                if (this.Value != null)
                    hashCode = hashCode * 59 + this.Value.GetHashCode();
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
