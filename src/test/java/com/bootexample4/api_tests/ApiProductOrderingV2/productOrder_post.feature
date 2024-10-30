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

    Examples:
      | read('productOrder_post.csv') |

  Scenario Outline: Test POST /productOrder with invalid payloads
    Given path '/productOrder'
    And request
      """
      <payload>
      """
    When method post
    Then status 400
    And match response ==
      """
      <expectedResponse>
      """

    Examples:
      | payload                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | expectedResponse                                                                                       |
      | { "order": { "type": "Instalacao", "infraType": "FTTH", "correlationOrder": "10", "customer": { "name": "Sandbox V.tal", "subscriberId": "SVTAL001", "phoneNumber": { "phoneNumbers": ["000000000", "", ""] } }, "addresses": { "address": { "id": 14393, "inventoryId": "1766156", "reference": "Do lado da padaria" } }, "appointment": { "date": "2021-05-05T08:00:00", "hasSlot": true, "mandatoryType": "Obrigatorio", "workOrderId": "SA-562403" }, "associatedDocument": "VTT001", "associatedDocumentDate": "2021-06-09T18:20:53-03:00", "products": { "product": [{ "action": "adicionar", "catalogId": "BL_9000MB" }] } } } | { "control": { "code": "400", "message": "Catalog ID with greater speed than allowed", "type": "E" } } |

  Scenario: Test GET /productOrder unauthorized access
    Given path '/productOrder'
    When method get
    Then status 401
    And match response ==
      """
      { "control": { "code": "401", "message": "Unauthorized", "type": "E" } }
      """

  Scenario: Test DELETE /productOrder not implemented method
    Given path '/productOrder'
    When method delete
    Then status 405
