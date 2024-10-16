# ********RoostGPT********

# Test generated by RoostGPT for test sampleArtilleryEnv2 using AI Type  and AI Model 
# 
# Feature file generated for /listener/productOrderInformationRequiredEvent_post for http method type POST 
# RoostTestHash=ce4c08f30f
# 
# 

# ********RoostGPT********
Feature: Test Product Order Information Required Event API

  Background:
    * def urlBase = karate.properties['nnnn_URL_BASE'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * configure headers = { Authorization: #(karate.properties['nnnn_AUTH_TOKEN']) }

  Scenario Outline: Verify successful POST request with valid notification data
    Given path '/listener/productOrderInformationRequiredEvent'
    And request
      """
      <body>
      """
    When method post
    Then status 204
    And match responseHeaders contains { 'Content-Type': 'application/json' }

    Examples:
      | read('listener_productOrderInformationRequiredEvent_post.csv') |

  Scenario: Verify POST request with unauthorized access
    Given path '/listener/productOrderInformationRequiredEvent'
    And request
      """
      { "notification": { "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001", "issue": { "action": "abrir", "code": "7029", "description": "Pendencia de agendamento", "fieldActivity": true, "observation": "", "reason": "PROJETO", "task": "", "type": "CLIENTE", "updateDate": "2021-02-17T17:19:50-03:00" } } } }
      """
    * configure headers = { Authorization: '' }
    When method post
    Then status 401

  Scenario: Verify POST request with missing required fields
    Given path '/listener/productOrderInformationRequiredEvent'
    And request
      """
      { "notification": { "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001" } } }
      """
    When method post
    Then status 400

  Scenario: Verify server error handling on POST request
    Given path '/listener/productOrderInformationRequiredEvent'
    And request
      """
      { "notification": { "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001", "issue": { "action": "abrir", "code": "7029", "description": "Pendencia de agendamento", "fieldActivity": true, "observation": "", "reason": "PROJETO", "task": "", "type": "CLIENTE", "updateDate": "2021-02-17T17:19:50-03:00" } } } }
      """
    * configure response = { status: 500 }
    When method post
    Then status 500
