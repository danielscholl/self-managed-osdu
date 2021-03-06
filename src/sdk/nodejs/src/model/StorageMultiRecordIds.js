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
    define(['ApiClient'], factory);
  } else if (typeof module === 'object' && module.exports) {
    // CommonJS-like environments that support module.exports, like Node.
    module.exports = factory(require('../ApiClient'));
  } else {
    // Browser globals (root is window)
    if (!root.SelfManagedOsdu) {
      root.SelfManagedOsdu = {};
    }
    root.SelfManagedOsdu.StorageMultiRecordIds = factory(root.SelfManagedOsdu.ApiClient);
  }
}(this, function(ApiClient) {
  'use strict';

  /**
   * The StorageMultiRecordIds model module.
   * @module model/StorageMultiRecordIds
   * @version 0.11.0
   */

  /**
   * Constructs a new <code>StorageMultiRecordIds</code>.
   * Multiple storage record ids and filter attributes.
   * @alias module:model/StorageMultiRecordIds
   * @class
   * @param records {Array.<String>} List of record ids. Each record id must follow the naming convention {OSDU-Account-Id}:{dataset-name}:{record-type}:{version}.
   */
  var exports = function(records) {
    this.records = records;
  };

  /**
   * Constructs a <code>StorageMultiRecordIds</code> from a plain JavaScript object, optionally creating a new instance.
   * Copies all relevant properties from <code>data</code> to <code>obj</code> if supplied or a new instance if not.
   * @param {Object} data The plain JavaScript object bearing properties of interest.
   * @param {module:model/StorageMultiRecordIds} obj Optional instance to populate.
   * @return {module:model/StorageMultiRecordIds} The populated <code>StorageMultiRecordIds</code> instance.
   */
  exports.constructFromObject = function(data, obj) {
    if (data) {
      obj = obj || new exports();
      if (data.hasOwnProperty('records'))
        obj.records = ApiClient.convertToType(data['records'], ['String']);
      if (data.hasOwnProperty('attributes'))
        obj.attributes = ApiClient.convertToType(data['attributes'], ['String']);
    }
    return obj;
  }

  /**
   * List of record ids. Each record id must follow the naming convention {OSDU-Account-Id}:{dataset-name}:{record-type}:{version}.
   * @member {Array.<String>} records
   */
  exports.prototype.records = undefined;

  /**
   * Filter attributes to restrict the returned fields of the record. Usage: data.{record-data-field-name}.
   * @member {Array.<String>} attributes
   */
  exports.prototype.attributes = undefined;


  return exports;

}));
