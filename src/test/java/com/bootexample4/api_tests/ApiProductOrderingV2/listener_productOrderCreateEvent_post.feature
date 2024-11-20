# ********RoostGPT********

# Test generated by RoostGPT for test sampleArtilleryEnv2 using AI Type Open AI and AI Model gpt-4-turbo
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

  Scenario Outline: Test Product Order Create Event API with valid input
    Given path '/listener/productOrderCreateEvent'
    And request
      """
      <requestBody>
      """
    When method post
    Then status 204
    And match responseHeaders['Content-Type'][0] == 'application/json'
    And match response == '#object'

    Examples:
      | read('listener_productOrderCreateEvent_post.csv') |

  Scenario: Test Product Order Create Event API with invalid input
    Given path '/listener/productOrderCreateEvent'
    And request
      """
      { "notification": { "date": "invalid-date", "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001" } } }
      """
    When method post
    Then status 400

  Scenario: Test Product Order Create Event API with unauthorized access
    Given path '/listener/productOrderCreateEvent'
    And request
      """
      { "notification": { "date": "2021-06-05T20:23:29-03:00", "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001" } } }
      """
    And header Authorization = 'InvalidToken'
    When method post
    Then status 401

  Scenario: Test server error for Product Order Create Event API
    Given path '/listener/productOrderCreateEvent'
    And request
      """
      { "notification": { "date": "2021-06-05T20:23:29-03:00", "order": { "associatedDocument": "VTT003", "correlationOrder": "30", "id": "20230315000003" } } }
      """
    When method post
    Then status 500
