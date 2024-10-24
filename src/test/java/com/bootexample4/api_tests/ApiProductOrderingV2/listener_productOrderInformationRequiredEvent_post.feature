# ********RoostGPT********

# Test generated by RoostGPT for test sampleArtilleryEnv2 using AI Type  and AI Model 
# 
# Feature file generated for /listener/productOrderInformationRequiredEvent_post for http method type POST 
# RoostTestHash=ce4c08f30f
# 
# 

# ********RoostGPT********
Feature: Product Order Information Required Event

  Background:
    * def urlBase = karate.properties['nnnn_URL_BASE'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * configure headers = { Authorization: #(karate.properties['nnnn_AUTH_TOKEN']) }

  Scenario Outline: Test POST request with different notification scenarios
    Given path '/listener/productOrderInformationRequiredEvent'
    And request
      """
      <requestBody>
      """
    When method post
    Then status <expectedStatus>
    And match response ==
      """
      <expectedResponse>
      """

    Examples:
      | requestBody                                                                                                                                                                                                                                                                                                                                                        | expectedStatus | expectedResponse |
      | { "notification": { "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001", "issue": { "action": "abrir", "code": "7029", "description": "Pendencia de agendamento", "fieldActivity": true, "observation": "", "reason": "PROJETO", "task": "", "type": "CLIENTE", "updateDate": "2021-02-17T17:19:50-03:00" } } } }          |            204 | {}               |
      | { "notification": { "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001", "issue": { "action": "abrir", "code": "7030", "description": "Pendencia de agendamento", "fieldActivity": false, "observation": "", "reason": "MANUNTENÇÃO", "task": "", "type": "TECNICA", "updateDate": "2022-02-25T11:50:50.566-03:00" } } } } |            204 | {}               |

  Scenario: Unauthorized access to the POST endpoint
    Given path '/listener/productOrderInformationRequiredEvent'
    And request
      """
      { "notification": { "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001", "issue": { "action": "abrir", "code": "7029", "description": "Pendencia de agendamento", "fieldActivity": true, "observation": "", "reason": "PROJETO", "task": "", "type": "CLIENTE", "updateDate": "2021-02-17T17:19:50-03:00" } } } }
      """
    And configure headers = { Authorization: 'invalid_token' }
    When method post
    Then status 401

  Scenario: Server error during POST request
    Given path '/listener/productOrderInformationRequiredEvent'
    And request
      """
      { "notification": { "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001", "issue": { "action": "abrir", "code": "7029", "description": "Pendencia de agendamento", "fieldActivity": true, "observation": "", "reason": "PROJETO", "task": "", "type": "CLIENTE", "updateDate": "2021-02-17T17:19:50-03:00" } } } }
      """
    When method post
    Then status 500
