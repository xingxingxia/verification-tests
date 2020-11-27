Feature: Test feature
  @admin
  Scenario: test kewang PR cucushift/pull/8223
    Given evaluation of `Time.now.utc.strftime "%s"` is stored in the :now clipboard
    When I store the masters in the :masters clipboard
    And I use the "<%= cb.masters[0].name %>" node
    And a "snippet_write" file is created with the following lines:
    """
    grep -hE '"verb":"(create|delete|patch|update)","user":.*(requestObject|responseObject)' /var/log/kube-apiserver/audit.log > /tmp/grep.json
    jq -c 'select (.requestReceivedTimestamp | .[0:19] + "Z" | fromdateiso8601 > <%= cb.now %>)' /tmp/grep.json | wc -l
    jq -c 'select (.requestReceivedTimestamp | .[0:19] + "Z" | fromdateiso8601 > <%= cb.now %>)' /tmp/grep.json | tail -n 1
    """
    When I run commands on the host:
      | <%= File.read("snippet_write") %> |
    Then the step should succeed
    And the expression should be true> @result[:response].split("\n")[0].to_i > 0

  @admin
  Scenario: test for kewang
    Given I switch to cluster admin pseudo user
    When I use the "openshift-kube-apiserver" project
    And a pod becomes ready with labels:
      | app=openshift-kube-apiserver | # Or just: | apiserver |
