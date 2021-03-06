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
    root.SelfManagedOsdu.SchemaInfoResponse = factory(root.SelfManagedOsdu.ApiClient, root.SelfManagedOsdu.SchemaInfo);
  }
}(this, function(ApiClient, SchemaInfo) {
  'use strict';

  /**
   * The SchemaInfoResponse model module.
   * @module model/SchemaInfoResponse
   * @version 0.11.0
   */

  /**
   * Constructs a new <code>SchemaInfoResponse</code>.
   * The response for a GET schema request
   * @alias module:model/SchemaInfoResponse
   * @class
   */
  var exports = function() {
  };

  /**
   * Constructs a <code>SchemaInfoResponse</code> from a plain JavaScript object, optionally creating a new instance.
   * Copies all relevant properties from <code>data</code> to <code>obj</code> if supplied or a new instance if not.
   * @param {Object} data The plain JavaScript object bearing properties of interest.
   * @param {module:model/SchemaInfoResponse} obj Optional instance to populate.
   * @return {module:model/SchemaInfoResponse} The populated <code>SchemaInfoResponse</code> instance.
   */
  exports.constructFromObject = function(data, obj) {
    if (data) {
      obj = obj || new exports();
      if (data.hasOwnProperty('schemaInfos'))
        obj.schemaInfos = ApiClient.convertToType(data['schemaInfos'], [SchemaInfo]);
      if (data.hasOwnProperty('offset'))
        obj.offset = ApiClient.convertToType(data['offset'], 'Number');
      if (data.hasOwnProperty('count'))
        obj.count = ApiClient.convertToType(data['count'], 'Number');
      if (data.hasOwnProperty('totalCount'))
        obj.totalCount = ApiClient.convertToType(data['totalCount'], 'Number');
    }
    return obj;
  }

  /**
   * @member {Array.<module:model/SchemaInfo>} schemaInfos
   */
  exports.prototype.schemaInfos = undefined;

  /**
   * The offset for the next query
   * @member {Number} offset
   */
  exports.prototype.offset = undefined;

  /**
   * The number of schema versions in this response
   * @member {Number} count
   */
  exports.prototype.count = undefined;

  /**
   * The total number of entity type codes in the repositories
   * @member {Number} totalCount
   */
  exports.prototype.totalCount = undefined;


  return exports;

}));
