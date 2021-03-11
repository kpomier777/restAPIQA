Feature: Examen

  Background: common
    Given I have access to Todo.ly

  @Regression @Acceptance
  Scenario: Pregunta 1
    When I send a request POST to url http://todo.ly/api/user.json with json
    """
    {
          "Email": "correoexamen2222@gmail.com",
          "FullName": "Name",
          "Password": "234"
    }
    """
    Then I expected response code 200
    And I expected the response body
    """
    {
    "Id": "IGNORE",
    "Email": "correoexamen2222@gmail.com",
    "Password": "IGNORE",
    "FullName": "Name",
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

  Scenario: Pregunta 2
    When I send a request POST to url http://todo.ly/api/projects.json with json
    """
   {
          "Content": "Parcial 2",
          "Icon": 6
   }
    """
    Then I expected response code 200
    And I expected the response body
    """
   {
        "Id": "IGNORE",
        "Content": "Parcial 2",
        "ItemsCount": 0,
        "Icon": 6,
        "ItemType": 2,
        "ParentId": null,
        "Collapsed": false,
        "ItemOrder": "IGNORE",
        "Children": [

        ],
        "IsProjectShared": false,
        "ProjectShareOwnerName": null,
        "ProjectShareOwnerEmail": null,
        "IsShareApproved": false,
        "IsOwnProject": true,
        "LastSyncedDateTime": "IGNORE",
        "LastUpdatedDate": "IGNORE",
        "Deleted": false,
        "SyncClientCreationId": null
    }
    """
    And I get the property Id save on ID_PROJECT
    When I send a request POST to url http://todo.ly/api/items.json with json
    """
   {
          "ProjectId": ID_PROJECT,
          "Content": "Parcial 2 Item"
   }
    """
    Then I expected response code 200
    And I expected the response body
    """
   {
    "Id": "IGNORE",
    "Content": "Parcial 2 Item",
    "ItemType": 1,
    "Checked": false,
    "ProjectId": ID_PROJECT,
    "ParentId": null,
    "Path": "",
    "Collapsed": false,
    "DateString": null,
    "DateStringPriority": 0,
    "DueDate": "",
    "Recurrence": null,
    "ItemOrder": "IGNORE",
    "Priority": 4,
    "LastSyncedDateTime": "IGNORE",
    "Children": [],
    "DueDateTime": null,
    "CreatedDate": "IGNORE",
    "LastCheckedDate": null,
    "LastUpdatedDate": "IGNORE",
    "Deleted": "IGNORE",
    "Notes": "",
    "InHistory": false,
    "SyncClientCreationId": null,
    "DueTimeSpecified": true,
    "OwnerId": "IGNORE"
}
    """

    And I get the property Id save on ITEM_ID_VALUE
    And I get the property Content save on ITEM_CONTENT_VALUE
    When I send a request PUT to url http://todo.ly/api/items/ITEM_ID_VALUE.json with json
    """
   {
          "Checked": true
   }
    """
    Then I expected response code 200
    And I expected the response body
    """
   {
    "Id": ITEM_ID_VALUE,
    "Content": ITEM_CONTENT_VALUE,
    "ItemType": 1,
    "Checked": true,
    "ProjectId": ID_PROJECT,
    "ParentId": null,
    "Path": "",
    "Collapsed": false,
    "DateString": null,
    "DateStringPriority": 0,
    "DueDate": "",
    "Recurrence": null,
    "ItemOrder": "IGNORE",
    "Priority": 4,
    "LastSyncedDateTime": "IGNORE",
    "Children": [],
    "DueDateTime": null,
    "CreatedDate": "IGNORE",
    "LastCheckedDate": "IGNORE",
    "LastUpdatedDate": "IGNORE",
    "Deleted": "IGNORE",
    "Notes": "",
    "InHistory": true,
    "SyncClientCreationId": null,
    "DueTimeSpecified": true,
    "OwnerId": "IGNORE"
}
    """

    When I send a request DELETE to url http://todo.ly/api/items/ITEM_ID_VALUE.json with json
    """
    """
    Then I expected response code 200

  Scenario: Pregunta 3
    When I send a request GET to url http://todo.ly/api/authentication/token.json with json
    """
    """
    Then I expected response code 200
    And I get the property TokenString save on TOKEN_VALUE
    And I expected the response body
    """
   {      "TokenString": TOKEN_VALUE,
          "UserEmail": "kevinpomier.kp@gmail.com",
          "ExpirationTime": "IGNORE"
   }
    """

    When I send a request DELETE to url http://todo.ly/api/authentication/token.json with json
    """
    """
    Then I expected response code 200