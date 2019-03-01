Feature: rsh.feature

  # @author cryan@redhat.com
  # @case_id OCP-10658
  Scenario: Check oc rsh for simpler access to a remote shell
    Given I have a project
    Given 360 seconds have passed
    Given 3600 seconds have passed
