Feature: Test feature
  @admin
  Scenario: test for kewang
    Given I switch to cluster admin pseudo user
    When I use the "openshift-kube-apiserver" project
    And a pod becomes ready with labels:
      | app=openshift-kube-apiserver | # Or just: | apiserver |

  Scenario: test ldap for pmali
    Given I have a project
    And I have LDAP service in my project
    Then I pry

