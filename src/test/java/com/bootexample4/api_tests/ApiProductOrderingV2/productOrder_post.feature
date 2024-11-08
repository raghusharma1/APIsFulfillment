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

  Scenario: Test GET request for unauthorized access
    Given path '/productOrder'
    When method get
    Then status 401
    And match response == { "control": { "code": "401", "message": "Unauthorized", "type": "E" } }

  Scenario: Test DELETE request for not found resource
    Given path '/productOrder', '123'
    When method delete
    Then status 404
    And match response == { "control": { "code": "404", "message": "Not Found", "type": "E" } }

  Scenario: Test POST request with invalid Catalog ID
    Given path '/productOrder'
    And request { "order": { "products": { "product": [{ "action": "adicionar", "catalogId": "BL_999MB" }] } } }
    When method post
    Then status 400
    And match response == { "control": { "code": "400", "message": "Catalog ID out of standard", "type": "E" } }

  Scenario: Test POST request with infraType mismatch
    Given path '/productOrder'
    And request { "order": { "infraType": "FTTN", "addresses": { "address": { "id": 14393, "inventoryId": "1766156" } } } }
    When method post
    Then status 406
    And match response == { "control": { "code": "406", "message": "Not Acceptable (Tipo de infraestrutura [infraType] informado diferente do contratado/permitido para o endereço informado)", "type": "E" } }
