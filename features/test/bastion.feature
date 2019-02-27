Feature: Test bastion feature
  @admin
  Scenario: Test ocp4 bastion
    Given I have a project
    And I select a random node's host
    When I run commands on the host:
      | ls / |
    Then the step should succeed

