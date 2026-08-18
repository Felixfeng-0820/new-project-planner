# Verification playbook

Design evidence from the claim backward. A check is useful only when its failure would challenge the claim being made.

## Contents

- [Build the evidence map](#build-the-evidence-map)
- [Evidence levels](#evidence-levels)
- [Fast and full sets](#fast-and-full-sets)
- [Red-green proof](#red-green-proof)
- [Interface-specific checks](#interface-specific-checks)
- [Data and recovery](#data-and-recovery)
- [Security and secret checks](#security-and-secret-checks)
- [Failure output](#failure-output)
- [Verification ledger](#verification-ledger)
- [Final convergence review](#final-convergence-review)

## Build the evidence map

For each slice, write:

- **Claim** — the exact user-observable behavior.
- **Risk** — what could be wrong while simpler checks still pass.
- **Fast evidence** — the shortest check that catches likely mistakes during implementation.
- **Boundary evidence** — the real interface or dependency that proves the pieces connect.
- **Acceptance evidence** — the full set required before completion or release.
- **Limitations** — platforms, data, providers, or paths not exercised.

Prefer repository-native commands. Do not create `tests/check.sh`, a Node test, a browser suite, or a pre-commit hook merely to make every project look the same.

## Evidence levels

### 1. Static

Use formatting, linting, type checking, schema validation, compilation, and package/build checks. These catch structure and compatibility issues but do not prove behavior.

### 2. Logic

Use unit, property, and deterministic transformation tests. Prefer real values and behavior assertions over mocks of the function being tested. Cover empty, invalid, boundary, and corruption cases that are meaningful for the product.

### 3. Integration

Exercise filesystem, database, queue, network, provider sandbox, subprocess, or inter-module boundaries. Use temporary or disposable resources. Assert both the expected result and important side effects.

### 4. Interface

Use the entry point the user or consumer actually touches: real browser, command, HTTP/event process, clean importing project, notebook or pipeline runner, simulator, or desktop application. Watch errors and failed resources at that surface.

### 5. Release

Build and inspect the distribution artifact, install from a clean environment, fetch the deployed version, or launch the packaged app. Confirm that the released object corresponds to the current source revision or version marker.

## Fast and full sets

The **fast set** should be cheap enough to run after every meaningful slice. It normally contains targeted static and logic checks plus the changed boundary when inexpensive.

The **full set** should cover the outcome contract, all changed boundaries, relevant regression suites, build/package, safety-sensitive behavior, and release verification. Run it with fresh output before final claims, pushes, releases, and deployments. At commit time, follow repository policy and run the checks proportionate to that checkpoint; do not turn every small local commit into an unrelated full-suite gate.

If the full set cannot run, do not rename a fallback as “full.” Report partial verification, state exactly what the fallback proves, and leave the missing check explicit.

## Red-green proof

For a reproducible bug or deterministic new behavior:

1. write or identify a check that expresses the intended behavior;
2. run it and confirm it fails for the expected reason;
3. implement the smallest coherent fix;
4. run the targeted check and relevant regression checks;
5. when practical, confirm the regression check would fail without the fix.

Do not delete valuable implementation work merely to perform ceremony. If the failure cannot be safely reproduced, explain why and choose the best alternative evidence.

## Interface-specific checks

### Browser UI

- Use the real page and core interactions.
- Fail or report on console errors, page errors, and failed required requests.
- Check browser storage reload only when persistence is promised.
- Verify visible and computed state for hidden/disabled/loading behavior.
- Check representative viewport and keyboard/accessibility behavior only to the level claimed.
- Close browser and server processes in guaranteed cleanup paths.

### API or worker

- Start the real test process and wait for readiness.
- Exercise main, invalid, unauthorized, conflict, and dependency-failure paths as relevant.
- Use disposable databases, queues, or provider sandboxes.
- Verify migrations, idempotency, retry, shutdown, and health only where the contract depends on them.

### CLI or automation

- Invoke the real executable or module entry point as a subprocess.
- Assert exit code, stdout, stderr, and filesystem or network effects.
- Use temporary fixtures; include odd paths, collisions, dry-run, repeat, and interruption where relevant.
- Verify cleanup of partial files and child processes.

### Data or AI

- Record input snapshot, hash, schema, split, seed, environment, and metric definition.
- Test the smallest end-to-end fixture, then representative data.
- Check leakage, duplication, missing values, and target construction.
- Compare against a naive baseline and report uncertainty, failure slices, cost, and latency when material.
- Re-run from a clean state or scripted pipeline before claiming reproducibility.

### Library or SDK

- Test public imports, types/signatures, errors, and documented examples.
- Build the distribution and install it in a new temporary consumer.
- Run the consumer against the installed artifact.
- Claim compatibility only for environments actually exercised.

### Mobile or desktop

- Build and launch in an available real runtime.
- Exercise the core gesture or interaction and inspect runtime/crash logs.
- Relaunch, background/resume, offline, and permission-denied paths when promised.
- Build the package/archive; treat signing and store submission separately.

## Data and recovery

Prove persistence with a round trip through the real storage boundary: write, restart or reload, and read. A `setItem`, ORM call, or mocked repository is not the round trip.

When data is invalid or partially written, test the product's declared recovery policy. Recovery may mean reject, quarantine, restore, migrate, or safely export. Choose based on sensitivity and scale. Never expose corrupt secrets or personal data merely to prove recoverability.

## Security and secret checks

Use the repository's established scanner or a reputable available scanner. Inspect the files or staged diff actually headed for a commit. Treat regex-only scans as a limited signal, not proof that no secret exists. Do not place realistic secret fixtures in the repository unless the scanner test design safely isolates them.

If a credential may have entered history or logs, stop. Preserve evidence without repeating the credential and ask the account owner to revoke or rotate it before further publication.

## Failure output

Translate a failing check into:

```text
What failed: <check or behavior>
Evidence: <command/interaction and decisive output>
Kind: code | environment | permission | data | external service
Impact: <which claim remains unverified>
Next safe action: <specific step>
```

Keep raw logs available, but lead with this plain-language block.

## Verification ledger

Record fresh evidence in the project's existing task system or `PROJECT_NOTES.md`:

| Time | Slice | Claim | Command or interaction | Result | Coverage and limitations |
|---|---|---|---|---|---|
| UTC timestamp | short name | exact behavior | exact command/path | pass/fail/blocked | what it proves and does not prove |

Do not write “all tests pass” without the command, exit result, and scope. Do not reuse stale evidence after relevant code, configuration, dependency, or environment changes.

## Final convergence review

After the full set passes:

1. reread the outcome contract and map every requirement to evidence;
2. inspect the final diff and changed-file list;
3. separate pre-existing failures from regressions;
4. check run, test, update, and recovery instructions against reality;
5. name all untested platforms, providers, datasets, or quality attributes;
6. only then state the verified outcome.
