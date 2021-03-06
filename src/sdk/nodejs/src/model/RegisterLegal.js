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
    root.SelfManagedOsdu.RegisterLegal = factory(root.SelfManagedOsdu.ApiClient);
  }
}(this, function(ApiClient) {
  'use strict';

  /**
   * The RegisterLegal model module.
   * @module model/RegisterLegal
   * @version 0.11.0
   */

  /**
   * Constructs a new <code>RegisterLegal</code>.
   * @alias module:model/RegisterLegal
   * @class
   */
  var exports = function() {
  };

  /**
   * Constructs a <code>RegisterLegal</code> from a plain JavaScript object, optionally creating a new instance.
   * Copies all relevant properties from <code>data</code> to <code>obj</code> if supplied or a new instance if not.
   * @param {Object} data The plain JavaScript object bearing properties of interest.
   * @param {module:model/RegisterLegal} obj Optional instance to populate.
   * @return {module:model/RegisterLegal} The populated <code>RegisterLegal</code> instance.
   */
  exports.constructFromObject = function(data, obj) {
    if (data) {
      obj = obj || new exports();
      if (data.hasOwnProperty('legaltags'))
        obj.legaltags = ApiClient.convertToType(data['legaltags'], ['String']);
      if (data.hasOwnProperty('otherRelevantDataCountries'))
        obj.otherRelevantDataCountries = ApiClient.convertToType(data['otherRelevantDataCountries'], ['String']);
    }
    return obj;
  }

  /**
   * @member {Array.<String>} legaltags
   */
  exports.prototype.legaltags = undefined;

  /**
   * @member {Array.<String>} otherRelevantDataCountries
   */
  exports.prototype.otherRelevantDataCountries = undefined;


  return exports;

}));
