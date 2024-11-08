# ********RoostGPT********

# Test generated by RoostGPT for test sampleArtilleryEnv2 using AI Type  and AI Model 
# 
# Feature file generated for /listener/cancelProductOrderCreateEvent_post for http method type POST 
# RoostTestHash=7601d79448
# 
# 

# ********RoostGPT********
Feature: Cancel Product Order Create Event By Client

  Background:
    * def urlBase = karate.properties['nnnn_URL_BASE'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * configure headers = { Authorization: #(karate.properties['nnnn_AUTH_TOKEN']) }

  Scenario Outline: Verify successful cancellation of product order creation event
    Given path '/listener/cancelProductOrderCreateEvent'
    And request
      """
      <requestBody>
      """
    When method POST
    Then status 204
    And match response == '#null'

    Examples:
      | read('listener_cancelProductOrderCreateEvent_post.csv') |

  Scenario Outline: Verify BadRequest when missing required fields in request
    Given path '/listener/cancelProductOrderCreateEvent'
    And request
      """
      <requestBody>
      """
    When method POST
    Then status 400

    Examples:
      | requestBody                                                         |
      | { "notification": { "order": { "associatedDocument": "VTT001" } } } |
      | { "notification": { "order": { "id": "20230315000001" } } }         |

  Scenario: Unauthorized access when no auth token provided
    * configure headers = {}
    Given path '/listener/cancelProductOrderCreateEvent'
    And request
      """
      { "notification": { "order": { "associatedDocument": "VTT001", "id": "20230315000001" } } }
      """
    When method POST
    Then status 401

  Scenario: Server error simulation
    Given path '/listener/cancelProductOrderCreateEvent'
    And request
      """
      { "notification": { "order": { "associatedDocument": "VTT001", "id": "20230315000001" } } }
      """
    When method POST
    Then status 500

  Scenario: Service unavailable
    Given path '/listener/cancelProductOrderCreateEvent'
    And request
      """
      { "notification": { "order": { "associatedDocument": "VTT001", "id": "20230315000001" } } }
      """
    When method POST
    Then status 503

  Scenario: Timeout error simulation
    Given path '/listener/cancelProductOrderCreateEvent'
    And request
      """
      { "notification": { "order": { "associatedDocument": "VTT001", "id": "20230315000001" } } }
      """
    When method POST
    Then status 504
