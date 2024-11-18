# ********RoostGPT********

# Test generated by RoostGPT for test sampleArtilleryEnv2 using AI Type  and AI Model 
# 
# Feature file generated for /listener/productOrderStateChangeEvent_post for http method type POST 
# RoostTestHash=a9bfb68d42
# 
# 

# ********RoostGPT********
Feature: State Change Event By Client

  Background:
    * def urlBase = karate.properties['nnnn_URL_BASE'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * configure headers = { Authorization: #(karate.properties['nnnn_AUTH_TOKEN']) }

  Scenario Outline: Verify state change event notification with valid input data
    Given path '/listener/productOrderStateChangeEvent'
    And request
      """
      <body>
      """
    When method post
    Then status 204
    And match responseHeaders contains { 'Content-Type': 'application/json' }
    And match response == {}

    Examples:
      | read('listener_productOrderStateChangeEvent_post.csv') |

  Scenario Outline: Verify state change event notification with invalid subscriber ID
    Given path '/listener/productOrderStateChangeEvent'
    And request
      """
      <body>
      """
    When method post
    Then status 400

    Examples:
      | body                                                                                                                                                                                                                                                                                      |
      | { "notification": { "customer": { "subscriberId": "invalid234567654" }, "date": "2021-09-29T18:42:24.641-03:00", "order": { "associatedDocument": "VTT001", "code": "2", "correlationOrder": "10", "description": "Ordem cancelada", "id": "20230315000001", "type": "Cancelamento" } } } |

  Scenario: Unauthorized access to state change event notification
    Given path '/listener/productOrderStateChangeEvent'
    And request
      """
      { "notification": { "customer": { "subscriberId": "234567654" }, "date": "2021-09-29T18:42:24.641-03:00", "order": { "associatedDocument": "VTT001", "code": "2", "correlationOrder": "10", "description": "Ordem cancelada", "id": "20230315000001", "type": "Cancelamento" } } }
      """
    When method post
    Then status 401

  Scenario: Server error during state change event notification processing
    Given path '/listener/productOrderStateChangeEvent'
    And request
      """
      { "notification": { "customer": { "subscriberId": "234567654" }, "date": "2021-09-29T18:42:24.641-03:00", "order": { "associatedDocument": "VTT001", "code": "2", "correlationOrder": "10", "description": "Ordem cancelada", "id": "20230315000001", "type": "Cancelamento" } } }
      """
    When method post
    Then status 500
