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
    describe('RegisterGetSubscriptionResult', function() {
      beforeEach(function() {
        instance = new SelfManagedOsdu.RegisterGetSubscriptionResult();
      });

      it('should create an instance of RegisterGetSubscriptionResult', function() {
        // TODO: update the code to test RegisterGetSubscriptionResult
        expect(instance).to.be.a(SelfManagedOsdu.RegisterGetSubscriptionResult);
      });

      it('should have the property id (base name: "id")', function() {
        // TODO: update the code to test the property id
        expect(instance).to.have.property('id');
        // expect(instance.id).to.be(expectedValueLiteral);
      });

      it('should have the property name (base name: "name")', function() {
        // TODO: update the code to test the property name
        expect(instance).to.have.property('name');
        // expect(instance.name).to.be(expectedValueLiteral);
      });

      it('should have the property description (base name: "description")', function() {
        // TODO: update the code to test the property description
        expect(instance).to.have.property('description');
        // expect(instance.description).to.be(expectedValueLiteral);
      });

      it('should have the property topic (base name: "topic")', function() {
        // TODO: update the code to test the property topic
        expect(instance).to.have.property('topic');
        // expect(instance.topic).to.be(expectedValueLiteral);
      });

      it('should have the property pushEndpoint (base name: "pushEndpoint")', function() {
        // TODO: update the code to test the property pushEndpoint
        expect(instance).to.have.property('pushEndpoint');
        // expect(instance.pushEndpoint).to.be(expectedValueLiteral);
      });

      it('should have the property createdBy (base name: "createdBy")', function() {
        // TODO: update the code to test the property createdBy
        expect(instance).to.have.property('createdBy');
        // expect(instance.createdBy).to.be(expectedValueLiteral);
      });

      it('should have the property notificationId (base name: "notificationId")', function() {
        // TODO: update the code to test the property notificationId
        expect(instance).to.have.property('notificationId');
        // expect(instance.notificationId).to.be(expectedValueLiteral);
      });

    });
  });

}));
