# Dependabot auto-triage lab

This isolated manifest fixture is for dependency detection only. Do not install,
require, or execute this bundle. It is not part of the Rails application's bundle.
No credentials, routes, or executable exploit examples are included.

## Target finding

- Package: `paratrooper-pingdom`, version `1.0.0`.
- [GitHub-reviewed advisory GHSA-fqrr-rrwg-69pv](https://github.com/advisories/GHSA-fqrr-rrwg-69pv)
  (CVE-2014-1233): local API login credentials disclosure.
- GitHub reports **Low** severity and **no patched version**, checked October 24, 2026.
- The lockfile records published dependency metadata; no packages were installed.
  Transitive dependencies may produce additional findings.

## Observe the rule

The repository rule `Demo - snooze low severity alerts until a patch is available`
is enabled and targets `severity:low`, with dismissal until a patch is available.

1. Review this PR. Opening it alone does not create a default-branch Dependabot alert.
2. If you choose to merge this lab, wait for GitHub to process the default branch's
   dependency graph. The assistant does not approve or merge this PR.
3. Open **Security and quality > Dependabot > Vulnerabilities**.
4. Clear `is:open`, select **Closed**, then **Closed as > Auto-dismissed**.
5. Find the advisory above and inspect its dismissal activity to verify which rule
   acted. A closed alert alone does not prove that this custom rule handled it.

The expected result is automatic dismissal of this matching alert while no patch
is available. It remains reviewable; it is not fixed or deleted. GitHub processing
is asynchronous, and rule evaluation must be checked after merge.

This PR does not change organization settings or auto-triage rules. Remove the lab
directory after the exercise. Removing the dependency does not erase its history.

## References

- [Dependabot alert detection](https://docs.github.com/en/code-security/concepts/supply-chain-security/dependabot-alerts)
- [Custom auto-triage rules](https://docs.github.com/en/code-security/how-tos/secure-your-supply-chain/manage-your-dependency-security/auto-triage-dependabot-alerts)
- [Review automatically dismissed alerts](https://docs.github.com/en/code-security/how-tos/manage-security-alerts/manage-dependabot-alerts/managing-automatically-dismissed-alerts)
