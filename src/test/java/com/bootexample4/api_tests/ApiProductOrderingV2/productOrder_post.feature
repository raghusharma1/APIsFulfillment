# ********RoostGPT********

# Test generated by RoostGPT for test sampleArtilleryEnv2 using AI Type  and AI Model 
# 
# Feature file generated for /productOrder_post for http method type POST 
# RoostTestHash=98c6afd708
# 
# 

# ********RoostGPT********
Feature: Request Opening Order API Testing

  Background:
    * def urlBase = karate.properties['nnnn_URL_BASE'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * configure headers = { Authorization: #(karate.properties['nnnn_AUTH_TOKEN']) }

  Scenario Outline: Test POST /productOrder with valid inputs
    Given path '/productOrder'
    And request
      """
      <payload>
      """
    When method post
    Then status 201
    And match response ==
      """
      <expectedResponse>
      """
    And match response contains { order: { id: '#string' } }

    Examples:
      | read('productOrder_post.csv') |

  Scenario Outline: Test POST /productOrder with invalid inputs
    Given path '/productOrder'
    And request
      """
      <payload>
      """
    When method post
    Then status <statusCode>
    And match response ==
      """
      <expectedResponse>
      """

    Examples:
      | payload                                                       | statusCode | expectedResponse                                                        |
      | { "order": { "type": "InvalidType", "infraType": "FTTP" } }   |        400 | { "control": { "code": "400", "message": "Bad Request", "type": "E" } } |
      | { "order": { "type": "Instalacao", "infraType": "Invalid" } } |        400 | { "control": { "code": "400", "message": "Bad Request", "type": "E" } } |
