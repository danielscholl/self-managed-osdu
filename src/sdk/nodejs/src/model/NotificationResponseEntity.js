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
    root.SelfManagedOsdu.NotificationResponseEntity = factory(root.SelfManagedOsdu.ApiClient);
  }
}(this, function(ApiClient) {
  'use strict';

  /**
   * The NotificationResponseEntity model module.
   * @module model/NotificationResponseEntity
   * @version 0.11.0
   */

  /**
   * Constructs a new <code>NotificationResponseEntity</code>.
   * @alias module:model/NotificationResponseEntity
   * @class
   */
  var exports = function() {
  };

  /**
   * Constructs a <code>NotificationResponseEntity</code> from a plain JavaScript object, optionally creating a new instance.
   * Copies all relevant properties from <code>data</code> to <code>obj</code> if supplied or a new instance if not.
   * @param {Object} data The plain JavaScript object bearing properties of interest.
   * @param {module:model/NotificationResponseEntity} obj Optional instance to populate.
   * @return {module:model/NotificationResponseEntity} The populated <code>NotificationResponseEntity</code> instance.
   */
  exports.constructFromObject = function(data, obj) {
    if (data) {
      obj = obj || new exports();
      if (data.hasOwnProperty('body'))
        obj.body = ApiClient.convertToType(data['body'], Object);
      if (data.hasOwnProperty('statusCode'))
        obj.statusCode = ApiClient.convertToType(data['statusCode'], 'String');
      if (data.hasOwnProperty('statusCodeValue'))
        obj.statusCodeValue = ApiClient.convertToType(data['statusCodeValue'], 'Number');
    }
    return obj;
  }

  /**
   * @member {Object} body
   */
  exports.prototype.body = undefined;

  /**
   * @member {String} statusCode
   */
  exports.prototype.statusCode = undefined;

  /**
   * @member {Number} statusCodeValue
   */
  exports.prototype.statusCodeValue = undefined;


  return exports;

}));