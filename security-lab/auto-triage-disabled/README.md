# Low-severity comparison with the custom rule disabled

This detection-only fixture is separate from the Rails application. Do not install
or execute this bundle. No credentials or executable exploit examples are included.

- Package: `paratrooper-newrelic` version `1.0.1`.
- [GHSA-959j-5g9v-3fpq](https://github.com/advisories/GHSA-959j-5g9v-3fpq)
  (CVE-2014-1232): exposure of sensitive information.
- GitHub reports **Low** severity and **no patched version**, checked October 24, 2026.
- This is a distinct advisory from the preceding `paratrooper-pingdom` lab.
- The lockfile records published RubyGems dependency metadata. No gems were installed.

Before opening this PR, the repository rule
`Demo - snooze low severity alerts until a patch is available` was saved as
**Disabled**. GitHub's existing development-dependency preset remains enabled.
This fixture is a default-scope dependency in its own isolated bundle; it is not
loaded by the Rails application. Transitive packages may yield additional findings.

## Observe after merge

Opening this PR alone does not create the default-branch Dependabot finding.
After Sabrina reviews and chooses to merge, wait for dependency graph processing.
In **Security and quality > Dependabot > Vulnerabilities**, search for
`paratrooper-newrelic` and inspect the alert's state and activity.

The disabled custom rule should not auto-dismiss this new matching alert. If it
is auto-dismissed, inspect the activity for another responsible rule. Other rules
and metadata can affect the outcome; an open PR does not prove alert behavior.

This PR does not approve or merge itself, change security settings, or reopen old
alerts. Remove the isolated fixture after the exercise. No tests were run.
