Feature: Test feature
  Scenario: Test whether serviceaccounts_get_token output printing is quiet
    Given I have a project
    When I run the :serviceaccounts_get_token client command with:
      | serviceaccount_name | default |
    Then the step should succeed
    And evaluation of `@result[:response]` is stored in the :token clipboard
