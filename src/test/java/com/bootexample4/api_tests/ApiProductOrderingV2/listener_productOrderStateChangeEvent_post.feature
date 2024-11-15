# ********RoostGPT********

# Test generated by RoostGPT for test sampleArtilleryEnv2 using AI Type  and AI Model 
# 
# Feature file generated for /listener/productOrderStateChangeEvent_post for http method type POST 
# RoostTestHash=a9bfb68d42
# 
# 

# ********RoostGPT********
Feature: Test Product Order State Change Event API

  Background:
    * def urlBase = karate.properties['nnnn_URL_BASE'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * configure headers = { Authorization: #(karate.properties['nnnn_AUTH_TOKEN']) }

  Scenario Outline: Validate successful state change notifications
    Given path '/listener/productOrderStateChangeEvent'
    And request
      """
      <payload>
      """
    When method post
    Then status 204
    And match responseHeaders['Content-Type'][0] == 'application/json'

    Examples:
      | read('listener_productOrderStateChangeEvent_post.csv') |

  Scenario: Invalid subscriber ID leads to BadRequest
    Given path '/listener/productOrderStateChangeEvent'
    And request
      """
      {'notification': {'customer': {'subscriberId': 'invalid'}, 'date': '2021-09-29T18:42:24.641-03:00', 'order': {'associatedDocument': 'VTT001', 'code': '2', 'correlationOrder': '10', 'description': 'Ordem cancelada', 'id': '20230315000001', 'type': 'Cancelamento'}}}
      """
    When method post
    Then status 400

  Scenario: Unauthorized access to state change endpoint
    * configure headers = { Authorization: 'InvalidToken' }
    Given path '/listener/productOrderStateChangeEvent'
    And request
      """
      {'notification': {'customer': {'subscriberId': '234567654'}, 'date': '2021-09-29T18:42:24.641-03:00', 'order': {'associatedDocument': 'VTT001', 'code': '2', 'correlationOrder': '10', 'description': 'Ordem cancelada', 'id': '20230315000001', 'type': 'Cancelamento'}}}
      """
    When method post
    Then status 401

  Scenario: Server error handling
    Given path '/listener/productOrderStateChangeEvent'
    And request
      """
      {'notification': {'customer': {'subscriberId': '234567654'}, 'date': '2021-09-29T18:42:24.641-03:00', 'order': {'associatedDocument': 'VTT001', 'code': '2', 'correlationOrder': '10', 'description': 'Ordem cancelada', 'id': '20230315000001', 'type': 'Cancelamento'}}}
      """
    When method post
    Then status 500
