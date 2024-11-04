# ********RoostGPT********

# Test generated by RoostGPT for test sampleArtilleryEnv2 using AI Type  and AI Model 
# 
# Feature file generated for /productOrder_post for http method type POST 
# RoostTestHash=98c6afd708
# 
# 

# ********RoostGPT********
Feature: Test the /productOrder API endpoint

  Background:
    * def urlBase = karate.properties['nnnn_URL_BASE'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * configure headers = { Authorization: #(karate.properties['nnnn_AUTH_TOKEN']) }

  Scenario Outline: Test POST /productOrder with various valid payloads
    Given path '/productOrder'
    And request <payload>
    When method post
    Then status 201
    And match response == <expectedResponse>

    Examples:
      | read('productOrder_post.csv') |

  Scenario: Test POST /productOrder with invalid Catalog ID
    Given path '/productOrder'
    And request read('examples/invalid_catalog_id.json')
    When method post
    Then status 400
    And match response == { "control": { "code": "400", "message": "Campo Catalog ID fora do padrão esperado", "type": "E" } }

  Scenario: Test GET /productOrder without authorization
    Given path '/productOrder'
    And header Authorization = null
    When method get
    Then status 401
    And match response == { "control": { "code": "401", "message": "Unauthorized", "type": "E" } }

  Scenario: Test DELETE /productOrder on a non-existent resource
    Given path '/productOrder', 'nonexistent'
    When method delete
    Then status 404
    And match response == { "control": { "code": "404", "message": "Not Found", "type": "E" } }

  Scenario: Test POST /productOrder with payload causing server error
    Given path '/productOrder'
    And request read('examples/complex_payload.json')
    When method post
    Then status 500
    And match response == { "control": { "code": "500", "message": "Internal Server Error", "type": "T" } }
