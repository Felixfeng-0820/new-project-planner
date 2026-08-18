# Guided mode

Use guided mode only when the environment cannot run the required commands or interfaces. Keep the same engineering standard while making the evidence boundary explicit.

## Phase handoff format

For each slice, provide:

1. the intended observable behavior;
2. each file or patch with its exact path;
3. one setup command if needed;
4. one fast verification command;
5. the expected success signal;
6. what output the user should return, especially the complete failure block.

Prefer a patch or attached files over a wall of unrelated code blocks. Do not ask the user to manually combine ambiguous fragments.

## Evidence labels

- **Prepared, not verified** — files or instructions are ready but no execution output exists.
- **User-reported** — the user says a command or interaction succeeded; quote the relevant output when available.
- **Verified from returned evidence** — the returned output directly supports the narrow claim.

Never upgrade user-reported evidence into a stronger browser, platform, provider, or release claim. A screenshot can prove visible state but may not prove console health, persistence, or the deployed version.

## Troubleshooting loop

When the user returns an error:

1. read the full command and output;
2. classify code, environment, permission, data, or external-service failure;
3. propose the smallest diagnostic command;
4. explain what each possible result would mean;
5. change code only after the evidence identifies the likely cause;
6. ask for fresh verification output.

Do not send a long list of speculative commands. Give the next most informative safe step.

## Files, secrets, and accounts

Never ask the user to paste API keys, tokens, private data, or full `.env` contents. Show placeholder names and where values should be stored. Ask for redacted status output when authentication must be checked.

When an external action is ready, describe the exact action and let the user run or authorize it. Do not say deployed, published, pushed, or sent until returned evidence supports that claim.

## Final handoff

End with:

- prepared files and their paths;
- commands still to run, in order;
- evidence already returned;
- claims still unverified;
- the next single action for the user.
