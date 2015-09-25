Feature: Reset
  As a developer
  I want to get the current environment
  In order to know what environment I am working on

  Scenario: dnsman was never used
    Given I never started using dnsman
    When I call the status command
    Then I shoud get an error

  Scenario: We have an existing dnsman configuration
    Given I used dnsman at least once
    And I my current environment is dev
    When I call the status command
    Then I should see the current environment
