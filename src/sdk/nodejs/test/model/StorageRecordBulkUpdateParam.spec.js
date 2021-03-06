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
    // AMD.
    define(['expect.js', '../../src/index'], factory);
  } else if (typeof module === 'object' && module.exports) {
    // CommonJS-like environments that support module.exports, like Node.
    factory(require('expect.js'), require('../../src/index'));
  } else {
    // Browser globals (root is window)
    factory(root.expect, root.SelfManagedOsdu);
  }
}(this, function(expect, SelfManagedOsdu) {
  'use strict';

  var instance;

  describe('(package)', function() {
    describe('StorageRecordBulkUpdateParam', function() {
      beforeEach(function() {
        instance = new SelfManagedOsdu.StorageRecordBulkUpdateParam();
      });

      it('should create an instance of StorageRecordBulkUpdateParam', function() {
        // TODO: update the code to test StorageRecordBulkUpdateParam
        expect(instance).to.be.a(SelfManagedOsdu.StorageRecordBulkUpdateParam);
      });

      it('should have the property query (base name: "query")', function() {
        // TODO: update the code to test the property query
        expect(instance).to.have.property('query');
        // expect(instance.query).to.be(expectedValueLiteral);
      });

      it('should have the property ops (base name: "ops")', function() {
        // TODO: update the code to test the property ops
        expect(instance).to.have.property('ops');
        // expect(instance.ops).to.be(expectedValueLiteral);
      });

    });
  });

}));
