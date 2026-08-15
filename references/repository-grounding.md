# Repository Grounding Procedure

## Objective
Create an evidence-based model of the existing system before proposing architecture or material code changes.

## Procedure
1. Identify repository root, application entry points, package/dependency manifests, build files, and deployment files.
2. Map top-level modules and responsibilities.
3. Identify architectural patterns already in use.
4. Identify data stores, schemas, migrations, queues, APIs, and external integrations.
5. Identify authentication, authorization, secrets, and trust boundaries.
6. Identify test frameworks and representative tests.
7. Identify CI/CD and release mechanics.
8. Identify logging, metrics, tracing, alerting, and operational runbooks.
9. Identify code ownership or domain boundaries when available.
10. Record unknowns rather than inventing answers.

## Output
Produce the grounding YAML defined in `SKILL.md`, followed by:

- Existing patterns to preserve
- Constraints
- High-risk areas
- Likely change surface
- Open questions

## Validation
Before leaving this stage, verify that every material architecture assumption is either:

- supported by repository evidence;
- supplied by the user;
- or explicitly labeled as an assumption.
