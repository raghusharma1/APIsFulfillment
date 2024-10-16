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

  Scenario Outline: Test successful creation of order with valid inputs
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
    And match response.path == 'productOrder'

    Examples:
      | read('productOrder_post.csv') |

  Scenario Outline: Test error responses for invalid inputs
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
    And match response.path == 'productOrder'

    Examples:
      | payload                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | statusCode | expectedResponse                                                        |
      | { "order": { "associatedDocument": "VTT001", "associatedDocumentDate": "2020-10-22T14:00:00-03:00", "correlationOrder": "2310", "customer": { "businessUnity": "empresarial", "fantasyName": "InterCorp Internet", "name": "V.tal", "phoneNumber": { "phoneNumbers": ["21965400000", "", ""] }, "subscriberId": "SVTAL001", "workContact": { "email": "sindicovtal@vtal.com", "name": "sindico Vtal", "phone": "21999900000" } }, "equipments": { "equipment": [{ "action": "adicionar", "code": 616551, "serialNumber": "ALCLF718RF05", "type": "ONT" }] }, "infraType": "FTTP", "type": "AssociarCPE" } } |        400 | { "control": { "code": "400", "message": "Bad Request", "type": "E" } } |
