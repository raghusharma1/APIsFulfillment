# ********RoostGPT********

# Test generated by RoostGPT for test sampleArtilleryEnv2 using AI Type  and AI Model 
# 
# Feature file generated for /productOrder_post for http method type POST 
# RoostTestHash=98c6afd708
# 
# 

# ********RoostGPT********
Feature: Test the productOrder API for various scenarios

  Background:
    * def urlBase = karate.properties['nnnn_URL_BASE'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * configure headers = { Authorization: #(karate.properties['nnnn_AUTH_TOKEN']) }

  Scenario Outline: Test POST request with valid input for <OrderType>
    Given path '/productOrder'
    And request <payload>
    When method post
    Then status 201
    And match response == <expectedResponse>

    Examples:
      | read('productOrder_post.csv') |

  Scenario: Test POST request with invalid Catalog ID
    Given path '/productOrder'
    And request read('payloads/InvalidCatalogID.json')
    When method post
    Then status 400
    And match response == { "control": { "code": "400", "message": "Campo Catalog ID fora do padrão esperado", "type": "E" } }

  Scenario: Test POST request with unauthorized access
    Given path '/productOrder'
    And request read('payloads/ValidRequest.json')
    When method post
    Then status 401
    And match response == { "control": { "code": "401", "message": "Unauthorized", "type": "E" } }

  Scenario: Test GET request for unauthorized access
    Given path '/productOrder'
    When method get
    Then status 403
    And match response == { "control": { "code": "403", "message": "Forbidden - Scope Not Permitted", "type": "E" } }

  Scenario: Test GET request for non-existing resource
    Given path '/productOrder/nonExisting'
    When method get
    Then status 404
    And match response == { "control": { "code": "404", "message": "Not Found", "type": "E" } }
