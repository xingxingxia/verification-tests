Feature: oc patch/apply related scenarios

  # @author xxia@redhat.com
  # @case_id OCP-10696
  @smoke
  @admin
  Scenario: oc patch can update one or more fields of rescource
    Given I have a project
    And I select a random node's host
    When I run commands on the host:
      | ls / |
    Then the step should succeed
