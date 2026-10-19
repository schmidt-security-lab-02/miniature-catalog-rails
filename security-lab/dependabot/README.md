# Dependabot API lab

This directory intentionally records WEBrick 1.8.1 to populate Dependabot alerts for the API dashboard exercise. It is an isolated development/test bundle. The Rails application's Gemfile does not load it. No server or exploit is included.

## Expected alerts

| Advisory | Severity | First patched version for this advisory |
| --- | --- | --- |
| [CVE-2024-47220 / GHSA-6f62-3596-g6w7](https://github.com/advisories/GHSA-6f62-3596-g6w7) | High | 1.8.2 |
| [CVE-2025-6442 / GHSA-r995-q44h-hr64](https://github.com/advisories/GHSA-r995-q44h-hr64) | Moderate | 1.8.2 |

The advisory database may contain additional findings. Version 1.8.2 is the first fix for the two advisories above, not a statement that it has no other vulnerabilities.

## Observe the results

1. Review and merge this lab PR into the default branch yourself.
2. Wait for GitHub to process the committed Gemfile.lock with dependency graph and Dependabot alerts enabled.
3. Open Security and quality > Dependabot > Vulnerabilities.
4. Query the existing organization/repository connection from the local Dependabot dashboard and refresh its data.

Creating this PR alone does not create default-branch Dependabot alerts. No installation or execution of this fixture is needed for this exercise.

## Cleanup

After collecting the sample data, remove this directory or update its manifest and lockfile to a currently patched WEBrick release. Verify the resulting alert state in GitHub.
