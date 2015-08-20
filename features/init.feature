Feature: Init
  As a developer
  I want to start using dnsman
  In order to make my life easier.

  Scenario: Call init for the first time
    Given dnsman init has not been executed before
    When I call the init command
    Then A new dns.yml file should have been created at dnsman config directory.

  Scenario: Call init when dnsman is already initialized
    Given dnsman has been already initialized
    When I call the init command
    Then the current dns.yml file should remain untouched.
