# Release and deployment

Release means delivering the product through its real consumption surface. Do not force every project into a hosted website.

## Choose the release type

- **Web UI** — static hosting, server-rendered application, or full-stack platform.
- **Backend/API/worker** — managed service, container, serverless runtime, or user infrastructure.
- **CLI/automation** — downloadable binary, package registry, install script, or internal artifact.
- **Data/AI** — reproducible pipeline, model artifact, evaluation report, scheduled job, API, or notebook plus locked environment.
- **Library/SDK** — package registry or versioned release artifact.
- **Mobile/desktop** — debug build, signed package, beta channel, or store submission.

Recommend the simplest target that meets runtime, region, privacy, cost, availability, and maintenance needs. Check current official platform documentation and pricing at release time; do not rely on hard-coded free-tier claims.

## Authority gate

If the current request has not already authorized the exact release action, state:

- target account, organization, repository, project, registry, or store;
- visibility and region;
- resources or records created or changed;
- expected cost;
- required credentials or signing material;
- rollback or recovery path;
- public address or artifact name, if predictable.

Then wait. Login status is capability, not consent. A current explicit authorization for a named target counts; do not ask twice.

## Pre-release gate

Before release:

1. run the full acceptance set with fresh output;
2. review the final diff and dependency changes;
3. scan changed or staged content for secrets with available project tooling;
4. build the production artifact from the intended revision;
5. record a version, commit, or content marker that can be checked after release;
6. confirm configuration, migrations, backups, and rollback for the selected risk overlays;
7. verify that provider sandbox/test resources are not confused with production.

Do not release from an unexplained dirty workspace.

## Release and verify

Perform the smallest reversible steps first. Capture the provider or registry output, then verify through the real delivery surface:

- open the deployed browser flow and check version plus decisive interactions;
- send real test requests to the released API and inspect health/logs;
- install the CLI or library into a clean environment from the published artifact;
- rerun the data/AI artifact from its declared inputs and environment;
- install and launch the packaged desktop/mobile build on the tested platform.

Confirm that the delivered version matches the intended source. A provider saying “deployment succeeded” is not the product smoke test.

## Failure and rollback

If release fails, classify whether the cause is build, permission, configuration, quota/cost, migration, provider, or product behavior. Do not repeatedly redeploy without new evidence.

Use the documented rollback only when authorized and safer than leaving the failed state. For databases and irreversible external writes, stop before guessing.

## Handoff when release is pending

Provide no more than the necessary next steps:

1. the one login, approval, credential, or account action only the user can complete;
2. what the agent will do after that action;
3. the exact verification that will prove release;
4. relevant cost, visibility, platform, or rollback caveats.

Record the status as pending or blocked. Never manufacture a URL, artifact, store state, or success claim.
