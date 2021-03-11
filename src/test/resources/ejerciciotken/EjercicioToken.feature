Feature: Use Token

  Background: common
    Given I have access to Todo.ly

  @Regression @Acceptance
  Scenario: Tarea

    When I send a request GET to url http://todo.ly/api/authentication/token.json with json
    """

    """
    Then I expected response code 200
    And I get the property TokenString save on TOKEN_VALUE
    And I expected the response body
    """
    {
      "TokenString": "TOKEN_VALUE",
      "UserEmail": "kevinpomier.kp@gmail.com",
      "ExpirationTime": "IGNORE"
    }
    """

    Then I send a POST request to http://todo.ly/api/projects.json using the token TOKEN_VALUE with the json
    """
    {
      "Content": "My cucumber project",
      "Icon": 5
    }
    """
    Then I expected response code 200
    And I get the property Id save on ID_VALUE
    And I expected the response body
    """
    {
        "Id": "IGNORE",
        "Content": "My cucumber project",
        "ItemsCount": 0,
        "Icon": 5,
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

    Then I send a PUT request to http://todo.ly/api/projects/ID_VALUE.json using the token TOKEN_VALUE with the json
    """
    {
      "Icon": 1
    }
    """
    Then  I expected response code 200
    And I expected the response body
    """
    {
        "Id": ID_VALUE,
        "Content": "My cucumber project",
        "ItemsCount": 0,
        "Icon": 1,
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


