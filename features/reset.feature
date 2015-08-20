Feature: Reset
  As a developer
  I want to restore my hosts file
  In order not to mess with the default configuration.

  Scenario: dnsman was neve used
    Given I never started using dnsman
    When I call the reset command
    Then nothing should happen to my hosts file

  Scenario: We have an existing dnsman configuration
    Given I used dnsman at least once
    When I call the reset command
    Then my hosts file should be restored
