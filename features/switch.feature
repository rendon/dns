Feature: Switch environment
  As a developer
  I want to switch from one environment to another
  In order to deal with a different set of servers.

  Scenario: At least one of the two envs is not defined
    Given environment A is not defined
    When I switch to environment A
    Then I should get an error

  #Scenario: Target environment exists
  #  Given env A is defined
  #  When I switch to environment A
  #  Then I should be using env A
