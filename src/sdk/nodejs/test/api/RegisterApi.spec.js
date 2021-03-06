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

  beforeEach(function() {
    instance = new SelfManagedOsdu.RegisterApi();
  });

  describe('(package)', function() {
    describe('RegisterApi', function() {
      describe('createADDMSRegistration', function() {
        it('should call createADDMSRegistration successfully', function(done) {
          // TODO: uncomment, update parameter values for createADDMSRegistration call and complete the assertions
          /*
          var dataPartitionId = "dataPartitionId_example";
          var opts = {};
          opts.body = new SelfManagedOsdu.RegisterDdms();
          opts.body.id = "";
          opts.body.name = "";
          opts.body.description = "";
          opts.body.contactEmail = "";
          opts.body.interfaces = [new SelfManagedOsdu.RegisterDdmsInterface()];
          opts.body.interfaces[0].entityType = "";
          opts.body.interfaces[0].schema = ;

          instance.createADDMSRegistration(dataPartitionId, opts, function(error, data, response) {
            if (error) {
              done(error);
              return;
            }
            // TODO: update response assertions
            expect(data).to.be.a(SelfManagedOsdu.RegisterDdms);
            expect(data.id).to.be.a('string');
            expect(data.id).to.be("");
            expect(data.name).to.be.a('string');
            expect(data.name).to.be("");
            expect(data.description).to.be.a('string');
            expect(data.description).to.be("");
            expect(data.contactEmail).to.be.a('string');
            expect(data.contactEmail).to.be("");
            {
              let dataCtr = data.interfaces;
              expect(dataCtr).to.be.an(Array);
              expect(dataCtr).to.not.be.empty();
              for (let p in dataCtr) {
                let data = dataCtr[p];
                expect(data).to.be.a(SelfManagedOsdu.RegisterDdmsInterface);
                expect(data.entityType).to.be.a('string');
                expect(data.entityType).to.be("");
                expect(data.schema).to.be.a(Object);
                expect(data.schema).to.be();

                      }
            }

            done();
          });
          */
          // TODO: uncomment and complete method invocation above, then delete this line and the next:
          done();
        });
      });
      describe('createASubscription', function() {
        it('should call createASubscription successfully', function(done) {
          // TODO: uncomment, update parameter values for createASubscription call and complete the assertions
          /*
          var dataPartitionId = "dataPartitionId_example";
          var opts = {};
          opts.body = new SelfManagedOsdu.RegisterSubscription();
          opts.body.name = "test-subscription";
          opts.body.description = "test description";
          opts.body.topic = "data-changed-v1";
          opts.body.pushEndpoint = "https://myListener.com";
          opts.body.secret = new SelfManagedOsdu.RegisterSecret();
          opts.body.secret.secretType = "HMAC";
          opts.body.secret.value = "hmacsecret";

          instance.createASubscription(dataPartitionId, opts, function(error, data, response) {
            if (error) {
              done(error);
              return;
            }
            // TODO: update response assertions
            expect(data).to.be.a(SelfManagedOsdu.RegisterSubscriptionCreateResult);
            expect(data.id).to.be.a('string');
            expect(data.id).to.be("dGVzdC1uYW1l");
            expect(data.name).to.be.a('string');
            expect(data.name).to.be("test-subscription");
            expect(data.description).to.be.a('string');
            expect(data.description).to.be("test description");
            expect(data.topic).to.be.a('string');
            expect(data.topic).to.be("data-changed-v1");
            expect(data.pushEndpoint).to.be.a('string');
            expect(data.pushEndpoint).to.be("https://myListener.com");
            expect(data.createdBy).to.be.a('string');
            expect(data.createdBy).to.be("test@myapp.com");
            expect(data.notificationId).to.be.a('string');
            expect(data.notificationId).to.be("de-6ee609b9-620e-477b-86f9-3b8907643a12");
            expect(data.createdOnEpoch).to.be.a(SelfManagedOsdu.RegisterCreatedOnEpoch);
                  expect(data.createdOnEpoch.seconds).to.be.a('number');
              expect(data.createdOnEpoch.seconds).to.be(1572275081);
              expect(data.createdOnEpoch.nanos).to.be.a('number');
              expect(data.createdOnEpoch.nanos).to.be(51000000);
            expect(data.secret).to.be.a(SelfManagedOsdu.RegisterSecret);
                  expect(data.secret.secretType).to.be.a('string');
              expect(data.secret.secretType).to.be("HMAC");
              expect(data.secret.value).to.be.a(Object);
              expect(data.secret.value).to.be("hmacsecret");

            done();
          });
          */
          // TODO: uncomment and complete method invocation above, then delete this line and the next:
          done();
        });
      });
      describe('createAnActionRegistration', function() {
        it('should call createAnActionRegistration successfully', function(done) {
          // TODO: uncomment, update parameter values for createAnActionRegistration call and complete the assertions
          /*
          var dataPartitionId = "dataPartitionId_example";
          var opts = {};
          opts.body = new SelfManagedOsdu.RegisterCreateAction();
          opts.body.id = "";
          opts.body.name = "";
          opts.body.description = "";
          opts.body.contactEmail = "";
          opts.body.img = "";
          opts.body.url = "https://myapp.osdu.com/action/{type}/{id}";
          opts.body.filter = new SelfManagedOsdu.RegisterFilter();
          opts.body.filter.entityType = [""];
          opts.body.filter.source = [""];
          opts.body.filter.version = [""];

          instance.createAnActionRegistration(dataPartitionId, opts, function(error, data, response) {
            if (error) {
              done(error);
              return;
            }
            // TODO: update response assertions
            expect(data).to.be.a(SelfManagedOsdu.RegisterAction);
            expect(data.id).to.be.a('string');
            expect(data.id).to.be("");
            expect(data.name).to.be.a('string');
            expect(data.name).to.be("");
            expect(data.description).to.be.a('string');
            expect(data.description).to.be("");
            expect(data.contactEmail).to.be.a('string');
            expect(data.contactEmail).to.be("");
            expect(data.img).to.be.a('string');
            expect(data.img).to.be("");
            expect(data.url).to.be.a('string');
            expect(data.url).to.be("https://myapp.osdu.com/action/{type}/{id}");
            expect(data.filter).to.be.a(SelfManagedOsdu.RegisterFilter);
                  {
                let dataCtr = data.filter.entityType;
                expect(dataCtr).to.be.an(Array);
                expect(dataCtr).to.not.be.empty();
                for (let p in dataCtr) {
                  let data = dataCtr[p];
                  expect(data).to.be.a('string');
                  expect(data).to.be("");
                }
              }
              {
                let dataCtr = data.filter.source;
                expect(dataCtr).to.be.an(Array);
                expect(dataCtr).to.not.be.empty();
                for (let p in dataCtr) {
                  let data = dataCtr[p];
                  expect(data).to.be.a('string');
                  expect(data).to.be("");
                }
              }
              {
                let dataCtr = data.filter.version;
                expect(dataCtr).to.be.an(Array);
                expect(dataCtr).to.not.be.empty();
                for (let p in dataCtr) {
                  let data = dataCtr[p];
                  expect(data).to.be.a('string');
                  expect(data).to.be("");
                }
              }
            expect(data.createdOnEpoch).to.be.a(Object);
            expect(data.createdOnEpoch).to.be();

            done();
          });
          */
          // TODO: uncomment and complete method invocation above, then delete this line and the next:
          done();
        });
      });
      describe('deleteADDMSRegistration', function() {
        it('should call deleteADDMSRegistration successfully', function(done) {
          // TODO: uncomment, update parameter values for deleteADDMSRegistration call
          /*
          var id = "id_example";
          var dataPartitionId = "dataPartitionId_example";

          instance.deleteADDMSRegistration(id, dataPartitionId, function(error, data, response) {
            if (error) {
              done(error);
              return;
            }

            done();
          });
          */
          // TODO: uncomment and complete method invocation above, then delete this line and the next:
          done();
        });
      });
      describe('deleteASubscriptionById', function() {
        it('should call deleteASubscriptionById successfully', function(done) {
          // TODO: uncomment, update parameter values for deleteASubscriptionById call
          /*
          var id = "id_example";
          var dataPartitionId = "dataPartitionId_example";

          instance.deleteASubscriptionById(id, dataPartitionId, function(error, data, response) {
            if (error) {
              done(error);
              return;
            }

            done();
          });
          */
          // TODO: uncomment and complete method invocation above, then delete this line and the next:
          done();
        });
      });
      describe('deleteAnActionRegistration', function() {
        it('should call deleteAnActionRegistration successfully', function(done) {
          // TODO: uncomment, update parameter values for deleteAnActionRegistration call
          /*
          var id = "id_example";
          var dataPartitionId = "dataPartitionId_example";

          instance.deleteAnActionRegistration(id, dataPartitionId, function(error, data, response) {
            if (error) {
              done(error);
              return;
            }

            done();
          });
          */
          // TODO: uncomment and complete method invocation above, then delete this line and the next:
          done();
        });
      });
      describe('getADDMSRegistration', function() {
        it('should call getADDMSRegistration successfully', function(done) {
          // TODO: uncomment, update parameter values for getADDMSRegistration call and complete the assertions
          /*
          var id = "id_example";
          var dataPartitionId = "dataPartitionId_example";

          instance.getADDMSRegistration(id, dataPartitionId, function(error, data, response) {
            if (error) {
              done(error);
              return;
            }
            // TODO: update response assertions
            expect(data).to.be.a(SelfManagedOsdu.RegisterDdms);
            expect(data.id).to.be.a('string');
            expect(data.id).to.be("");
            expect(data.name).to.be.a('string');
            expect(data.name).to.be("");
            expect(data.description).to.be.a('string');
            expect(data.description).to.be("");
            expect(data.contactEmail).to.be.a('string');
            expect(data.contactEmail).to.be("");
            {
              let dataCtr = data.interfaces;
              expect(dataCtr).to.be.an(Array);
              expect(dataCtr).to.not.be.empty();
              for (let p in dataCtr) {
                let data = dataCtr[p];
                expect(data).to.be.a(SelfManagedOsdu.RegisterDdmsInterface);
                expect(data.entityType).to.be.a('string');
                expect(data.entityType).to.be("");
                expect(data.schema).to.be.a(Object);
                expect(data.schema).to.be();

                      }
            }

            done();
          });
          */
          // TODO: uncomment and complete method invocation above, then delete this line and the next:
          done();
        });
      });
      describe('getASubscriptionById', function() {
        it('should call getASubscriptionById successfully', function(done) {
          // TODO: uncomment, update parameter values for getASubscriptionById call and complete the assertions
          /*
          var id = "id_example";
          var dataPartitionId = "dataPartitionId_example";

          instance.getASubscriptionById(id, dataPartitionId, function(error, data, response) {
            if (error) {
              done(error);
              return;
            }
            // TODO: update response assertions
            expect(data).to.be.a(SelfManagedOsdu.RegisterGetSubscriptionResult);
            expect(data.id).to.be.a('string');
            expect(data.id).to.be("dGVzdC1uYW1l");
            expect(data.name).to.be.a('string');
            expect(data.name).to.be("test-subscription");
            expect(data.description).to.be.a('string');
            expect(data.description).to.be("test description");
            expect(data.topic).to.be.a('string');
            expect(data.topic).to.be("data-changed-v1");
            expect(data.pushEndpoint).to.be.a('string');
            expect(data.pushEndpoint).to.be("https://myListener.com");
            expect(data.createdBy).to.be.a('string');
            expect(data.createdBy).to.be("test@myapp.com");
            expect(data.notificationId).to.be.a('string');
            expect(data.notificationId).to.be("de-6ee609b9-620e-477b-86f9-3b8907643a12");

            done();
          });
          */
          // TODO: uncomment and complete method invocation above, then delete this line and the next:
          done();
        });
      });
      describe('getAnActionRegistration', function() {
        it('should call getAnActionRegistration successfully', function(done) {
          // TODO: uncomment, update parameter values for getAnActionRegistration call and complete the assertions
          /*
          var id = "id_example";
          var dataPartitionId = "dataPartitionId_example";

          instance.getAnActionRegistration(id, dataPartitionId, function(error, data, response) {
            if (error) {
              done(error);
              return;
            }
            // TODO: update response assertions
            expect(data).to.be.a(SelfManagedOsdu.RegisterAction);
            expect(data.id).to.be.a('string');
            expect(data.id).to.be("");
            expect(data.name).to.be.a('string');
            expect(data.name).to.be("");
            expect(data.description).to.be.a('string');
            expect(data.description).to.be("");
            expect(data.contactEmail).to.be.a('string');
            expect(data.contactEmail).to.be("");
            expect(data.img).to.be.a('string');
            expect(data.img).to.be("");
            expect(data.url).to.be.a('string');
            expect(data.url).to.be("https://myapp.osdu.com/action/{type}/{id}");
            expect(data.filter).to.be.a(SelfManagedOsdu.RegisterFilter);
                  {
                let dataCtr = data.filter.entityType;
                expect(dataCtr).to.be.an(Array);
                expect(dataCtr).to.not.be.empty();
                for (let p in dataCtr) {
                  let data = dataCtr[p];
                  expect(data).to.be.a('string');
                  expect(data).to.be("");
                }
              }
              {
                let dataCtr = data.filter.source;
                expect(dataCtr).to.be.an(Array);
                expect(dataCtr).to.not.be.empty();
                for (let p in dataCtr) {
                  let data = dataCtr[p];
                  expect(data).to.be.a('string');
                  expect(data).to.be("");
                }
              }
              {
                let dataCtr = data.filter.version;
                expect(dataCtr).to.be.an(Array);
                expect(dataCtr).to.not.be.empty();
                for (let p in dataCtr) {
                  let data = dataCtr[p];
                  expect(data).to.be.a('string');
                  expect(data).to.be("");
                }
              }
            expect(data.createdOnEpoch).to.be.a(Object);
            expect(data.createdOnEpoch).to.be();

            done();
          });
          */
          // TODO: uncomment and complete method invocation above, then delete this line and the next:
          done();
        });
      });
      describe('listAllTopics', function() {
        it('should call listAllTopics successfully', function(done) {
          // TODO: uncomment, update parameter values for listAllTopics call and complete the assertions
          /*
          var dataPartitionId = "dataPartitionId_example";

          instance.listAllTopics(dataPartitionId, function(error, data, response) {
            if (error) {
              done(error);
              return;
            }
            // TODO: update response assertions
            let dataCtr = data;
            expect(dataCtr).to.be.an(Array);
            expect(dataCtr).to.not.be.empty();
            for (let p in dataCtr) {
              let data = dataCtr[p];
              expect(data).to.be.a(SelfManagedOsdu.RegisterTopic);
              expect(data.name).to.be.a('string');
              expect(data.name).to.be("records-changed");
              expect(data.description).to.be.a('string');
              expect(data.description).to.be("This notification is sent whenever a record is created, updated or deleted.");
              expect(data.state).to.be.a('string');
              expect(data.state).to.be("ACTIVE");
              {
                let dataCtr = data.example;
                expect(dataCtr).to.be.an(Array);
                expect(dataCtr).to.not.be.empty();
                for (let p in dataCtr) {
                  let data = dataCtr[p];
                  expect(data).to.be.a(SelfManagedOsdu.RegisterTopicExample);
                  expect(data.id).to.be.a('string');
                  expect(data.id).to.be("common:test:123");
                  expect(data.kind).to.be.a('string');
                  expect(data.kind).to.be("common:source:type:1.0.0");
                  expect(data.op).to.be.a('string');
                  expect(data.op).to.be("deleted");
  
                        }
              }
            }

            done();
          });
          */
          // TODO: uncomment and complete method invocation above, then delete this line and the next:
          done();
        });
      });
      describe('queryADDMSRegistration', function() {
        it('should call queryADDMSRegistration successfully', function(done) {
          // TODO: uncomment, update parameter values for queryADDMSRegistration call and complete the assertions
          /*
          var type = "type_example";
          var dataPartitionId = "dataPartitionId_example";

          instance.queryADDMSRegistration(type, dataPartitionId, function(error, data, response) {
            if (error) {
              done(error);
              return;
            }
            // TODO: update response assertions
            let dataCtr = data;
            expect(dataCtr).to.be.an(Array);
            expect(dataCtr).to.not.be.empty();
            for (let p in dataCtr) {
              let data = dataCtr[p];
              expect(data).to.be.a(SelfManagedOsdu.RegisterDdms);
              expect(data.id).to.be.a('string');
              expect(data.id).to.be("");
              expect(data.name).to.be.a('string');
              expect(data.name).to.be("");
              expect(data.description).to.be.a('string');
              expect(data.description).to.be("");
              expect(data.contactEmail).to.be.a('string');
              expect(data.contactEmail).to.be("");
              {
                let dataCtr = data.interfaces;
                expect(dataCtr).to.be.an(Array);
                expect(dataCtr).to.not.be.empty();
                for (let p in dataCtr) {
                  let data = dataCtr[p];
                  expect(data).to.be.a(SelfManagedOsdu.RegisterDdmsInterface);
                  expect(data.entityType).to.be.a('string');
                  expect(data.entityType).to.be("");
                  expect(data.schema).to.be.a(Object);
                  expect(data.schema).to.be();
  
                        }
              }
            }

            done();
          });
          */
          // TODO: uncomment and complete method invocation above, then delete this line and the next:
          done();
        });
      });
      describe('retrieveAnActionRegistration', function() {
        it('should call retrieveAnActionRegistration successfully', function(done) {
          // TODO: uncomment, update parameter values for retrieveAnActionRegistration call and complete the assertions
          /*
          var dataPartitionId = "opendes";
          var opts = {};
          opts.body = new SelfManagedOsdu.RegisterRecord();
          opts.body.id = "";
          opts.body.kind = "";
          opts.body.acl = new SelfManagedOsdu.RegisterAcl();
          opts.body.acl.viewers = [""];
          opts.body.acl.owners = [""];
          opts.body.legal = new SelfManagedOsdu.RegisterLegal();
          opts.body.legal.legaltags = [""];
          opts.body.legal.otherRelevantDataCountries = [""];
          opts.body.data = new SelfManagedOsdu.RegisterData();
          opts.body.data.msg = "Hello";
          opts.body.data.uri = "https://myproj.com/abc123";

          instance.retrieveAnActionRegistration(dataPartitionId, opts, function(error, data, response) {
            if (error) {
              done(error);
              return;
            }
            // TODO: update response assertions
            let dataCtr = data;
            expect(dataCtr).to.be.an(Array);
            expect(dataCtr).to.not.be.empty();
            for (let p in dataCtr) {
              let data = dataCtr[p];
              expect(data).to.be.a(SelfManagedOsdu.RegisterAction);
              expect(data.id).to.be.a('string');
              expect(data.id).to.be("");
              expect(data.name).to.be.a('string');
              expect(data.name).to.be("");
              expect(data.description).to.be.a('string');
              expect(data.description).to.be("");
              expect(data.contactEmail).to.be.a('string');
              expect(data.contactEmail).to.be("");
              expect(data.img).to.be.a('string');
              expect(data.img).to.be("");
              expect(data.url).to.be.a('string');
              expect(data.url).to.be("https://myapp.osdu.com/action/{type}/{id}");
              expect(data.filter).to.be.a(SelfManagedOsdu.RegisterFilter);
                    {
                  let dataCtr = data.filter.entityType;
                  expect(dataCtr).to.be.an(Array);
                  expect(dataCtr).to.not.be.empty();
                  for (let p in dataCtr) {
                    let data = dataCtr[p];
                    expect(data).to.be.a('string');
                    expect(data).to.be("");
                  }
                }
                {
                  let dataCtr = data.filter.source;
                  expect(dataCtr).to.be.an(Array);
                  expect(dataCtr).to.not.be.empty();
                  for (let p in dataCtr) {
                    let data = dataCtr[p];
                    expect(data).to.be.a('string');
                    expect(data).to.be("");
                  }
                }
                {
                  let dataCtr = data.filter.version;
                  expect(dataCtr).to.be.an(Array);
                  expect(dataCtr).to.not.be.empty();
                  for (let p in dataCtr) {
                    let data = dataCtr[p];
                    expect(data).to.be.a('string');
                    expect(data).to.be("");
                  }
                }
              expect(data.createdOnEpoch).to.be.a(Object);
              expect(data.createdOnEpoch).to.be();
            }

            done();
          });
          */
          // TODO: uncomment and complete method invocation above, then delete this line and the next:
          done();
        });
      });
      describe('testAnActionRegistration', function() {
        it('should call testAnActionRegistration successfully', function(done) {
          // TODO: uncomment, update parameter values for testAnActionRegistration call and complete the assertions
          /*
          var dataPartitionId = "dataPartitionId_example";
          var opts = {};
          opts.body = new SelfManagedOsdu.RegisterTestAction();
          opts.body.action = new SelfManagedOsdu.RegisterCreateAction();
          opts.body.action.id = "";
          opts.body.action.name = "";
          opts.body.action.description = "";
          opts.body.action.contactEmail = "";
          opts.body.action.img = "";
          opts.body.action.url = "https://myapp.osdu.com/action/{type}/{id}";
          opts.body.action.filter = new SelfManagedOsdu.RegisterFilter();
          opts.body.action.filter.entityType = [""];
          opts.body.action.filter.source = [""];
          opts.body.action.filter.version = [""];
          opts.body.testPayload = ;

          instance.testAnActionRegistration(dataPartitionId, opts, function(error, data, response) {
            if (error) {
              done(error);
              return;
            }
            // TODO: update response assertions
            expect(data).to.be.a(SelfManagedOsdu.RegisterTestActionResult);
            expect(data.url).to.be.a('string');
            expect(data.url).to.be("");
            expect(data.errors).to.be.a('string');
            expect(data.errors).to.be("");

            done();
          });
          */
          // TODO: uncomment and complete method invocation above, then delete this line and the next:
          done();
        });
      });
      describe('updateSecretForSubscription', function() {
        it('should call updateSecretForSubscription successfully', function(done) {
          // TODO: uncomment, update parameter values for updateSecretForSubscription call
          /*
          var id = "id_example";
          var dataPartitionId = "dataPartitionId_example";
          var opts = {};
          opts.body = new SelfManagedOsdu.RegisterSecret();
          opts.body.secretType = "HMAC";
          opts.body.value = "hmacsecret";

          instance.updateSecretForSubscription(id, dataPartitionId, opts, function(error, data, response) {
            if (error) {
              done(error);
              return;
            }

            done();
          });
          */
          // TODO: uncomment and complete method invocation above, then delete this line and the next:
          done();
        });
      });
    });
  });

}));
