/*
 * self-managed-osdu
 * Rest API Documentation for Self Managed OSDU
 *
 * OpenAPI spec version: 0.11.0
 *
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen.git
 *
 * Swagger Codegen version: 2.4.22
 *
 * Do not edit the class manually.
 *
 */

(function(root, factory) {
  if (typeof define === 'function' && define.amd) {
    // AMD. Register as an anonymous module.
    define(['ApiClient', 'model/SchemaInfo'], factory);
  } else if (typeof module === 'object' && module.exports) {
    // CommonJS-like environments that support module.exports, like Node.
    module.exports = factory(require('../ApiClient'), require('./SchemaInfo'));
  } else {
    // Browser globals (root is window)
    if (!root.SelfManagedOsdu) {
      root.SelfManagedOsdu = {};
    }
    root.SelfManagedOsdu.SchemaRequest = factory(root.SelfManagedOsdu.ApiClient, root.SelfManagedOsdu.SchemaInfo);
  }
}(this, function(ApiClient, SchemaInfo) {
  'use strict';

  /**
   * The SchemaRequest model module.
   * @module model/SchemaRequest
   * @version 0.11.0
   */

  /**
   * Constructs a new <code>SchemaRequest</code>.
   * @alias module:model/SchemaRequest
   * @class
   * @param schema {Object} 
   * @param schemaInfo {module:model/SchemaInfo} 
   */
  var exports = function(schema, schemaInfo) {
    this.schema = schema;
    this.schemaInfo = schemaInfo;
  };

  /**
   * Constructs a <code>SchemaRequest</code> from a plain JavaScript object, optionally creating a new instance.
   * Copies all relevant properties from <code>data</code> to <code>obj</code> if supplied or a new instance if not.
   * @param {Object} data The plain JavaScript object bearing properties of interest.
   * @param {module:model/SchemaRequest} obj Optional instance to populate.
   * @return {module:model/SchemaRequest} The populated <code>SchemaRequest</code> instance.
   */
  exports.constructFromObject = function(data, obj) {
    if (data) {
      obj = obj || new exports();
      if (data.hasOwnProperty('schema'))
        obj.schema = ApiClient.convertToType(data['schema'], Object);
      if (data.hasOwnProperty('schemaInfo'))
        obj.schemaInfo = SchemaInfo.constructFromObject(data['schemaInfo']);
    }
    return obj;
  }

  /**
   * @member {Object} schema
   */
  exports.prototype.schema = undefined;

  /**
   * @member {module:model/SchemaInfo} schemaInfo
   */
  exports.prototype.schemaInfo = undefined;


  return exports;

}));