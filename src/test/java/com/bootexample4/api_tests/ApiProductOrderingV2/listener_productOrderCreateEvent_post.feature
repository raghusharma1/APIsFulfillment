# ********RoostGPT********

# Test generated by RoostGPT for test sampleArtilleryEnv2 using AI Type  and AI Model 
# 
# Feature file generated for /listener/productOrderCreateEvent_post for http method type POST 
# RoostTestHash=5d5b9532f3
# 
# 

# ********RoostGPT********
Feature: Testing Product Order Create Event By Client API

  Background:
    * def urlBase = karate.properties['nnnn_URL_BASE'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * configure headers = { Authorization: #(karate.properties['nnnn_AUTH_TOKEN']) }

  Scenario Outline: Test Product Order Create Event By Client with valid data
    Given path '/listener/productOrderCreateEvent'
    And request
      """
      <requestBody>
      """
    When method post
    Then status 204
    And match response == '#null'
    And match responseHeaders['Content-Type'][0] == 'application/json'

    Examples:
      | read('listener_productOrderCreateEvent_post.csv') |

  Scenario: Test Product Order Create Event By Client with Unauthorized access
    Given path '/listener/productOrderCreateEvent'
    And request
      """
      { "notification": { "date": "2021-06-05T20:23:29-03:00", "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001" } } }
      """
    And header Authorization = 'InvalidToken'
    When method post
    Then status 401

  Scenario: Test Product Order Create Event By Client with BadRequest
    Given path '/listener/productOrderCreateEvent'
    And request
      """
      { "invalidField": "invalidData" }
      """
    When method post
    Then status 400

  Scenario: Test Product Order Create Event By Client with Server Error
    Given path '/listener/productOrderCreateEvent'
    And request
      """
      { "notification": { "date": "2021-06-05T20:23:29-03:00", "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001" } } }
      """
    When method post
    Then status 500

  Scenario: Test Product Order Create Event By Client with Service Unavailable
    Given path '/listener/productOrderCreateEvent'
    And request
      """
      { "notification": { "date": "2021-06-05T20:23:29-03:00", "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001" } } }
      """
    When method post
    Then status 503

  Scenario: Test Product Order Create Event By Client with Timeout Error
    Given path '/listener/productOrderCreateEvent'
    And request
      """
      { "notification": { "date": "2021-06-05T20:23:29-03:00", "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001" } } }
      """
    When method post
    Then status 504
