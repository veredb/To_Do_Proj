Feature: Create user
   I want to be able to create many users
 
 Acceptance Criteria:
 * User must have name
 * User must be publicly visible once saved
 
 Scenario:creating a user
   Given I am on the homepage
   And I click "New User"
   Then I should see "New user"
   When I fill in "Vered" for "Name"
   And I fill in "vered@gmail.com" for "Email"
   And I press "Create User"
   Then I should see "User was successfully created."
   And I should see "Vered"
   And I should see "vered@gmail.com"
 
 Scenario:creating a user with no name
   Given I am on the homepage
   And I click "New User"
   Then I should see "New user"
   When I fill in "" for "Name"
   And I fill in "vered@gmail.com" for "Email"
   And I press "Create User"
   Then I should see "Name is too short (minimum is 2 characters)"
 
 Scenario:creating a user with no email
   Given I am on the homepage
   And I click "New User"
   Then I should see "New user"
   When I fill in "Vered Bauer" for "Name"
   And I fill in "" for "Email"
   And I press "Create User"
   Then I should see "Email is too short (minimum is 2 characters)"
 
 Scenario:creating a user with a name longer than 30 char
   Given I am on the homepage
   And I click "New User"
   Then I should see "New user"
   When I fill in "Vered Bauer Batz Raviv The first and the first one" for "Name"
   And I fill in "vered@gmail.com" for "Email"
   And I press "Create User"
   Then I should see "Name is too long (maximum is 30 characters)"
 
 Scenario:creating a user with an email longer than 30 char
   Given I am on the homepage
   And I click "New User"
   Then I should see "New user"
   When I fill in "Vered Bauer" for "Name"
   And I fill in "vered@gmail7777777777777777.com" for "Email"
   And I press "Create User"
   Then I should see "Email is too long (maximum is 30 characters)"


