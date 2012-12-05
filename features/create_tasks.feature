Feature: User creates task
  As a user
  In order to write my tasks for each day
  I want to publish a to do list

Acceptance Criteria:
* Task must have title
* Task must be publicly visible once saved


Scenario:creating a task
 Given I am on the homepage
 And I press "Add_task"
 When I fill in "Buy milk" for "Title"
 And I fill in "1" for "User"
 And I fill in "2012-02-02" for "date"
 And I fill in "1" for "Priority"
 And I press "Create Task"
 Then I should see "Task was successfully created."
 And I should see "Buy milk" 
 And I should see "1"
 And I should see "2012-02-02"
 And I should see "1"

Scenario:creating a task with no title
    Given I am on the homepage
    And I click "Add task"
    Then I should see "Add your task here"
    When I fill in "" for "Title"
    And I fill in "1" for "User"
    And I fill in "2012-02-02" for "date"
    And I fill in "1" for "Priority"
    And I press "Create Task"
    Then I should see "Title is too short (minimum is 2 characters)"

Scenario:creating a task with no user_id
    Given I am on the homepage
    And I click "Add task"
    Then I should see "Add your task here"
    When I fill in "hair cut" for "Title"
    And I fill in "" for "User"
    And I fill in "2012-02-02" for "date"
    And I fill in "1" for "Priority"
    And I press "Create Task"
    Then I should see "User is too short (minimum is 1 characters)"

Scenario:creating a task with title longer than 20 char
    Given I am on the homepage
    And I click "Add task"
    Then I should see "Add your task here"
    When I fill in "Go to the barber and get a hair cut" for "Title"
    And I fill in "1" for "User"
    And I fill in "2012-02-02" for "date"
    And I fill in "1" for "Priority"
    And I press "Create Task"
    Then I should see "Title is too long (maximum is 20 characters)"

Scenario:creating a task with a user_id longer than 20 char
    Given I am on the homepage
    And I click "Add task"
    Then I should see "Add your task here"
    When I fill in "hair cut" for "Title"
    And I fill in "11111111111111111111111" for "User"
    And I fill in "2012-02-02" for "date"
    And I fill in "1" for "Priority"
    And I press "Create Task"
    Then I should see "User is too long (maximum is 20 characters)"

