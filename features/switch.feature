Feature: Switch environment
  As a developer
  I want to switch from one environment to another
  In order to deal with a different set of servers.

  Scenario: At least one of the two envs is not defined
    Given I try to move from env A to env B
    And env A has not been defined
    When I switch environment
    Then I should get an error

  Scenario: Both environments exists
    Given I try to move from env A to env B
    And both envs A and B are defined
    When I switch environment
    Then I should be using env B
