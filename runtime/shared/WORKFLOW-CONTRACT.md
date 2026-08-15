# Runtime-Neutral Workflow Contract

This contract is the stable interface between the AI Engineering Operating System and any coding runtime.

## States

`INTAKE -> ROUTED -> GROUNDED -> SPECIFIED -> ARCHITECTED -> CHALLENGED -> PLANNED -> IMPLEMENTING -> REVIEWING -> VERIFYING -> RELEASE_READY -> DONE`

A task may move backward when a gate fails. Never skip a required state for the selected risk route.

## Risk routes

- **FAST**: localized, reversible, low-blast-radius change. `INTAKE -> GROUNDED -> IMPLEMENTING -> VERIFYING -> DONE`.
- **STANDARD**: feature/integration/moderate architecture. Requires specification, architecture, challenge, decomposition, independent review, and verification.
- **ENTERPRISE**: security/safety/compliance/sensitive-data/critical-platform/agentic autonomy. Adds threat model, ADRs, security review, explicit human gates, and release readiness.

## Durable artifacts

Store project artifacts in `.ai-engineering/` unless the project already has an equivalent governed location:

- `project-brief.md`
- `constitution.md`
- `grounding.md`
- `spec.md`
- `architecture.md`
- `adrs/`
- `tasks/`
- `reviews/`
- `verification.md`
- `release-readiness.md`
- `state.json`

Do not duplicate existing authoritative artifacts. Reference them instead.

## Gate semantics

Every gate resolves to exactly one of:

- `PASS` — objective evidence supports continuation.
- `PASS_WITH_RISKS` — continuation is acceptable and residual risks are explicitly recorded.
- `BLOCKED` — do not continue until the named deficiency is resolved or a human explicitly accepts the risk.

## Independence rule

For STANDARD and ENTERPRISE work, the implementation agent must not be the only reviewer. Use a separate context, subagent, agent/thread, or human reviewer.

## Completion rule

A completion claim requires evidence for:

1. acceptance criteria;
2. tests and/or objective validation;
3. architectural alignment;
4. no unresolved blocking review findings;
5. rollback/recovery path where production behavior changes.
