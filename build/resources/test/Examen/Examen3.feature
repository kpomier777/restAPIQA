Feature: Examen

  Background: common
    Given I have access to Todo.ly

  @Projectos
  Scenario: Pregunta 1
    When I send a request POST to url http://todo.ly/api/user.json with json
    """
    {
          "Email": "nuevo2222.kp@gmail.com",
          "FullName": "Kevin",
          "Password": "123"
    }
    """
    Then I expected response code 200
    And I expected the response body
    """
    {
    "Id": "IGNORE",
    "Email": "nuevo2222.kp@gmail.com",
    "Password": "IGNORE",
    "FullName": "Kevin",
    "TimeZone": 0,
    "IsProUser": false,
    "DefaultProjectId": "IGNORE",
    "AddItemMoreExpanded": false,
    "EditDueDateMoreExpanded": false,
    "ListSortType": 0,
    "FirstDayOfWeek": 0,
    "NewTaskDueDate": -1,
    "TimeZoneId": "IGNORE"
    }
    """
    And I get the property Id save on USER_VALUE
    When I send a request PUT to url http://todo.ly/api/user/0.json with json
    """
    {
          "FullName": "New Name"
    }
    """
    Then I expected response code 200
    And I expected the response body
    """
    {
    "Id": "IGNORE",
    "Email": "kevinpomier.kp@gmail.com",
    "Password": null,
    "FullName": "New Name",
    "TimeZone": 0,
    "IsProUser": false,
    "DefaultProjectId": "IGNORE",
    "AddItemMoreExpanded": false,
    "EditDueDateMoreExpanded": false,
    "ListSortType": 0,
    "FirstDayOfWeek": 0,
    "NewTaskDueDate": -1,
    "TimeZoneId": "IGNORE"
}
    """
    When I send a request DELETE to url http://todo.ly/api/user/0.json with json
    """
    """
    Then I expected response code 200
    And I expected the response body
    """
    {
    "Id": "IGNORE",
    "Email": "kevinpomier.kp@gmail.com",
    "Password": null,
    "FullName": "New Name",
    "TimeZone": 0,
    "IsProUser": false,
    "DefaultProjectId": "IGNORE",
    "AddItemMoreExpanded": false,
    "EditDueDateMoreExpanded": false,
    "ListSortType": 0,
    "FirstDayOfWeek": 0,
    "NewTaskDueDate": -1,
    "TimeZoneId": "IGNORE"
}
    """

