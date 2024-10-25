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

  Scenario Outline: Validate successful state change notifications
    Given path '/listener/productOrderStateChangeEvent'
    And request
      """
      <notification>
      """
    When method post
    Then status 204
    And match response == '#null'

    Examples:
      | read('listener_productOrderStateChangeEvent_post.csv') |

  Scenario: Unauthorized access to state change notification endpoint
    Given path '/listener/productOrderStateChangeEvent'
    And request
      """
      { "notification": { "customer": { "subscriberId": "234567654" }, "date": "2022-01-01T12:00:00-03:00", "order": { "associatedDocument": "VTT001", "code": "1", "correlationOrder": "10", "description": "Enviando Atualização de Ordem", "id": "20230315000001", "type": "Atualização" } } }
      """
    When method post
    Then status 401

  Scenario: Server error during state change notification processing
    Given path '/listener/productOrderStateChangeEvent'
    And request
      """
      { "notification": { "customer": { "subscriberId": "234567654" }, "date": "2022-01-01T12:00:00-03:00", "order": { "associatedDocument": "VTT001", "code": "1", "correlationOrder": "10", "description": "Enviando Atualização de Ordem", "id": "20230315000001", "type": "Atualização" } } }
      """
    When method post
    Then status 500
