# ********RoostGPT********

# Test generated by RoostGPT for test sampleArtilleryEnv2 using AI Type Open AI and AI Model gpt-4-turbo
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
    And match responseHeaders contains { 'Content-Type': 'application/json' }
    And match response == <expectedResponse>

    Examples:
      | read('listener_productOrderInformationRequiredEvent_post.csv') |

  Scenario: Verify POST request for Product Order Information Required Event with invalid data
    Given path '/listener/productOrderInformationRequiredEvent'
    And request
      """
      { "notification": { "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001", "issue": { "action": "abrir", "code": "invalid_code", "description": "Invalid description", "fieldActivity": "not_boolean", "observation": "", "reason": "INVALID_REASON", "task": "", "type": "INVALID_TYPE", "updateDate": "invalid_date" } } } }
      """
    When method post
    Then status 400

  Scenario: Verify POST request for Product Order Information Required Event with unauthorized access
    Given path '/listener/productOrderInformationRequiredEvent'
    And request
      """
      { "notification": { "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001", "issue": { "action": "abrir", "code": "7029", "description": "Pendencia de agendamento", "fieldActivity": true, "observation": "", "reason": "PROJETO", "task": "", "type": "CLIENTE", "updateDate": "2021-02-17T17:19:50-03:00" } } } }
      """
    * configure headers = { Authorization: 'InvalidToken' }
    When method post
    Then status 401

  Scenario: Verify server error handling
    Given path '/listener/productOrderInformationRequiredEvent'
    And request
      """
      { "notification": { "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001", "issue": { "action": "abrir", "code": "7029", "description": "Pendencia de agendamento", "fieldActivity": true, "observation": "", "reason": "PROJETO", "task": "", "type": "CLIENTE", "updateDate": "2021-02-17T17:19:50-03:00" } } } }
      """
    And header X-Force-Response-Code = 500
    When method post
    Then status 500
