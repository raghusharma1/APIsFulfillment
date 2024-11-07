# ********RoostGPT********

# Test generated by RoostGPT for test sampleArtilleryEnv2 using AI Type  and AI Model 
# 
# Feature file generated for /listener/productOrderInformationRequiredEvent_post for http method type POST 
# RoostTestHash=ce4c08f30f
# 
# 

# ********RoostGPT********
Feature: Product Order Information Required Event API

  Background:
    * def urlBase = karate.properties['nnnn_URL_BASE'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * configure headers = { Authorization: #(karate.properties['nnnn_AUTH_TOKEN']) }

  Scenario Outline: Verify POST request for Product Order Information Required Event with valid data
    Given path '/listener/productOrderInformationRequiredEvent'
    And request
      """
      <body>
      """
    When method post
    Then status 204
    And match response == '#null'
    And match responseHeaders['Content-Type'][0] == 'application/json'

    Examples:
      | read('listener_productOrderInformationRequiredEvent_post.csv') |

  Scenario: Verify POST request for Product Order Information Required Event with invalid data
    Given path '/listener/productOrderInformationRequiredEvent'
    And request
      """
      { "notification": {} }
      """
    When method post
    Then status 400

  Scenario: Verify unauthorized access to Product Order Information Required Event
    Given path '/listener/productOrderInformationRequiredEvent'
    And request
      """
      { "notification": { "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001", "issue": { "action": "abrir", "code": "7029", "description": "Pendencia de agendamento", "fieldActivity": true, "observation": "", "reason": "PROJETO", "task": "", "type": "CLIENTE", "updateDate": "2021-02-17T17:19:50-03:00" } } } }
      """
    And configure headers = { Authorization: 'InvalidToken' }
    When method post
    Then status 401

  Scenario: Verify server error for Product Order Information Required Event
    Given path '/listener/productOrderInformationRequiredEvent'
    And request
      """
      { "notification": { "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001", "issue": { "action": "abrir", "code": "7029", "description": "Pendencia de agendamento", "fieldActivity": true, "observation": "", "reason": "PROJETO", "task": "", "type": "CLIENTE", "updateDate": "2021-02-17T17:19:50-03:00" } } } }
      """
    And configure headers = { Authorization: #(karate.properties['nnnn_AUTH_TOKEN']) }
    When method post
    Then status 500
