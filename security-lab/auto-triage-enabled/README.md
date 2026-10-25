# Low-severity comparison with auto-triage enabled

This detection-only manifest repeats the preceding lab's dependency in a new
manifest location. It is separate from the Rails bundle. Do not install or execute
it. It contains no credentials or exploit code.

- `paratrooper-newrelic` version `1.0.1`.
- [GHSA-959j-5g9v-3fpq](https://github.com/advisories/GHSA-959j-5g9v-3fpq),
  CVE-2014-1234: Low severity, no patched version published when checked.
- The custom repository rule `Demo - snooze low severity alerts until a patch is available`
  was re-enabled before this PR was opened.
- Its target is `severity:low`; its action dismisses alerts until a patch is available.

After merge and dependency processing, inspect Dependabot's closed alerts and
the individual alert activity. Verify automatic dismissal attributed to this rule,
rather than assuming that absence from the open list proves remediation.
The rule also applies to existing matching alerts, so earlier Low findings may
be auto-dismissed without requiring a new PR. Moderate findings do not match.

If the dependency graph updates but alerts remain stale, use Dependabot's
**More Dependabot options > Refresh Dependabot alerts** and wait for completion.

This lab adds only manifest files and this explanation. No packages were installed
or executed. Remove the lab fixtures after observation.
