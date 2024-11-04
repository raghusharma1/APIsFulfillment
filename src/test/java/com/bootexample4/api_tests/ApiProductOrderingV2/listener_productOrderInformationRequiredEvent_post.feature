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

  Scenario Outline: Test POST request with different notification types for product order
    Given path '/listener/productOrderInformationRequiredEvent'
    And request
      """
      <body>
      """
    When method post
    Then status <expected_status>
    And match response contains { notification: #object }
    And match response.notification.order == <body>.notification.order
    And match response.notification.order.issue.code == <body>.notification.order.issue.code

    Examples:
      | body                                                                                                                                                                                                                                                                                                                                                               | expected_status |
      | { "notification": { "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001", "issue": { "action": "abrir", "code": "7029", "description": "Pendencia de agendamento", "fieldActivity": true, "observation": "", "reason": "PROJETO", "task": "", "type": "CLIENTE", "updateDate": "2021-02-17T17:19:50-03:00" } } } }          |             204 |
      | { "notification": { "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001", "issue": { "action": "abrir", "code": "7030", "description": "Pendencia de agendamento", "fieldActivity": false, "observation": "", "reason": "MANUNTENÇÃO", "task": "", "type": "TECNICA", "updateDate": "2022-02-25T11:50:50.566-03:00" } } } } |             204 |

  Scenario: Test unauthorized access to the POST endpoint
    Given path '/listener/productOrderInformationRequiredEvent'
    And request
      """
      { "notification": { "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001", "issue": { "action": "abrir", "code": "7029", "description": "Pendencia de agendamento", "fieldActivity": true, "observation": "", "reason": "PROJETO", "task": "", "type": "CLIENTE", "updateDate": "2021-02-17T17:19:50-03:00" } } } }
      """
    And header Authorization = 'InvalidToken'
    When method post
    Then status 401

  Scenario: Test POST request with incorrect content type
    Given path '/listener/productOrderInformationRequiredEvent'
    And request
      """
      { "notification": { "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001", "issue": { "action": "abrir", "code": "7029", "description": "Pendencia de agendamento", "fieldActivity": true, "observation": "", "reason": "PROJETO", "task": "", "type": "CLIENTE", "updateDate": "2021-02-17T17:19:50-03:00" } } } }
      """
    And header Content-Type = 'text/plain'
    When method post
    Then status 400

  Scenario: Test server timeout
    Given path '/listener/productOrderInformationRequiredEvent'
    And request
      """
      { "notification": { "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001", "issue": { "action": "abrir", "code": "7029", "description": "Pendencia de agendamento", "fieldActivity": true, "observation": "", "reason": "PROJETO", "task": "", "type": "CLIENTE", "updateDate": "2021-02-17T17:19:50-03:00" } } } }
      """
    And header 'X-Simulate-Timeout' = 'true'
    When method post
    Then status 504
