# Project profiles

Select profiles from the user's outcome and the repository's real entry points. Use an existing-project overlay whenever the workspace already contains code. Combine profiles for mixed systems; their boundary checks accumulate.

## Routing order

1. Detect an existing repository and read its instructions, manifests, scripts, tests, current status, and recent history.
2. Identify the real user entry point: browser, HTTP/event boundary, command, dataset/model, imported API, or installed application.
3. Select one primary profile and any secondary profiles.
4. Add risk overlays for production or sensitive data, credentials, third-party writes, paid services, publication, signing, migrations, or destructive operations.
5. Choose the smallest vertical slice that crosses the important boundary and can be verified independently.

Do not choose a profile from a fashionable framework. Choose it from the product behavior that must be proven.

## Profile matrix

| Profile | Select when | Typical vertical slices | Decisive evidence |
|---|---|---|---|
| Web UI | A browser is the main interface | runnable shell → core flow → state/API boundary → resilience and usability → optional release | Real-browser interaction, clean console/page/network state, production build |
| Backend/API | Requests, events, jobs, queues, or services are the main boundary | contract → domain behavior → persistence/adapters → operations/security → optional release | Requests against a real test process and disposable dependencies |
| CLI/automation | Users invoke a command, batch job, scheduler, or filesystem workflow | interface and dry-run → transformation → external boundaries → interruption and packaging | Real process invocation in temporary fixtures, exit status, stdout/stderr, repeated run |
| Data/AI | The product transforms data, trains/evaluates a model, retrieves knowledge, or calls an LLM | data contract → tiny pipeline → baseline → evaluation/error analysis → reproducible artifact | Provenance, split/leakage checks, end-to-end fixture, baseline comparison, reproducibility |
| Library/SDK | Other code imports a public API | API contract → smallest implementation → compatibility/errors → packaging and consumer example | Clean install into a fresh consumer plus public API tests |
| Mobile/desktop | The result must install and run in a native, cross-platform, or desktop runtime | buildable shell → core flow → platform services → lifecycle/offline/permissions → package | Install/launch in the actual available runtime, interaction, relaunch, logs, package build |

## Existing-project overlay

Apply this overlay before a runtime profile:

- Read `AGENTS.md` and repository documentation before editing.
- Identify the package manager, lockfile, language versions, scripts, test layout, formatting, hooks, and CI gates.
- Capture pre-existing dirty state and failures. Do not “clean up” unrelated work.
- Follow established architecture and naming. Avoid framework migrations or broad refactors unless they are necessary for the requested outcome.
- Add the smallest regression proof around the changed behavior, then run the relevant native suite/build.
- Review the final diff for unrelated files and distinguish pre-existing failures from regressions.

Do not add `PROJECT_NOTES.md`, a new test framework, a hook system, or a build wrapper automatically when the repository already has an equivalent convention.

## Web UI

Use the project's current component, unit, and browser tooling. For greenfield work, choose the least complex stack that supports the requested behavior and delivery target.

Fast evidence may include lint/type checks, targeted component or logic tests, and a production build when cheap. Run a real-browser check when changing UI wiring, routing, browser storage, network integration, accessibility behavior, or responsive layout.

The full browser path should cover the promised core action, relevant empty/invalid states, console and page errors, failed required resources, and reload only when persistence is claimed. Test damaged local data and recovery only when the product actually stores valuable local data; never export sensitive payloads blindly.

Do not claim visual correctness from jsdom, HTTP availability from a unit test, or responsive behavior from one viewport.

## Backend/API

Start with the external contract: request or event shape, response or side effect, error behavior, authentication boundary, and compatibility expectations.

Keep domain logic independently testable, then verify adapters against disposable real dependencies when practical. For databases, test migrations on disposable data and cover rollback or forward compatibility as the project's release process requires. For workers or queues, prove retry, idempotency, dead-letter, or interruption behavior only where claimed.

Full evidence commonly includes starting the real service, health/readiness, main and negative requests, authorization, persistence, shutdown, and the repository's build/package checks. Mocks do not prove the real database, provider SDK, queue, or network policy.

## CLI and automation

Treat the command interface as a public API. Define input, output, exit codes, error messages, filesystem effects, dry-run behavior, and supported platforms.

Run the actual entry point as a subprocess inside a temporary directory. Use fixtures, including paths with spaces and unusual characters. Verify stdout and stderr separately, non-zero failures, collision handling, partial-write cleanup, safe interruption where relevant, and a repeated run for idempotent workflows.

For tools touching valuable files, default to preview or dry-run when possible and never test against the only copy. A library unit test does not prove packaging, command discovery, executable permissions, or shell quoting.

## Data and AI

Write down the data contract and provenance before modeling. Inspect schema, missingness, units, timestamps, target construction, duplication, and licensing or privacy constraints.

Create a tiny deterministic end-to-end fixture before scaling. Pin seeds and environments where determinism is possible. Split data according to the real prediction boundary; use time-aware or group-aware splits when random splitting would leak information.

Always compare a model or heuristic against an appropriate naive baseline. Report metric definitions, uncertainty or tolerance, failure slices, latency, and cost where they matter. A successful notebook run does not prove reproducibility; rerun from a clean state or a scripted pipeline. For LLM/RAG systems, keep a representative evaluation set, separate retrieval from answer quality, and do not treat a few good examples as an accuracy claim.

## Library and SDK

Design from the consumer's point of view: stable import path, public types or signatures, error behavior, version/runtime support, and minimal example.

Test public behavior rather than internals. Build the distribution artifact and install it into a fresh temporary consumer environment. Run the documented example against the installed artifact, not the source checkout. Check compatibility only on environments actually exercised and avoid promising semantic-version stability that has not been assessed.

## Mobile and desktop

Use the platform's native build and test system. Verify in an actual simulator, emulator, or desktop runtime that is available; name the platform and configuration tested.

Cover launch, the core interaction, relaunch or resume when state is claimed, offline and permission-denied behavior when relevant, and crash/runtime logs. Package or archive the app before claiming a distributable build. Signing, store submission, certificates, and paid developer accounts are separate authorized external actions.

Do not infer iOS behavior from Android, native behavior from a web preview, or signed distribution from a successful debug build.

## Risk overlays

Add stricter gates without changing the base profile:

- **Production data** — use read-only inspection first, backups and migration rehearsal, explicit target confirmation, and a rollback plan.
- **Sensitive data** — minimize access and copies, redact logs, avoid third-party uploads, and record retention or deletion needs.
- **Third-party writes** — use sandbox/test mode and dry-run where available; confirm exact destination and affected records.
- **Paid resources** — estimate cost and wait for approval before provisioning or running a chargeable workload.
- **Publication or deployment** — confirm target, visibility, version, rollback, and post-release verification.
- **Signing or stores** — never invent or move credentials; verify only the artifact and platform actually authorized.
- **Destructive operations** — prefer preview, backups, explicit resolved targets, and recoverable actions.

When profiles or overlays conflict, use the stronger evidence and consent requirement.
