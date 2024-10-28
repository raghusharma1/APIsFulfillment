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

  Scenario Outline: Testing POST request with various notifications
    Given path '/listener/productOrderInformationRequiredEvent'
    And request
      """
      <request_body>
      """
    When method post
    Then status <status_code>
    And match response contains
      """
      <response_schema>
      """

    Examples:
      | request_body                                                                                                                                                                                                                                                                                                                    | status_code | response_schema |
      | {"notification":{"order":{"associatedDocument":"VTT001","correlationOrder":"10","id":"20230315000001","issue":{"action":"abrir","code":"7029","description":"Pendencia de agendamento","fieldActivity":true,"observation":"","reason":"PROJETO","task":"","type":"CLIENTE","updateDate":"2021-02-17T17:19:50-03:00"}}}}         |         204 | {}              |
      | {"notification":{"order":{"associatedDocument":"VTT001","correlationOrder":"10","id":"20230315000001","issue":{"action":"abrir","code":"7030","description":"Pendencia de agendamento","fieldActivity":false,"observation":"","reason":"MANUTENÇÃO","task":"","type":"TECNICA","updateDate":"2022-02-25T11:50:50.566-03:00"}}}} |         204 | {}              |
