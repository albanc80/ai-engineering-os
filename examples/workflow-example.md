# Example — STANDARD Feature

## Request
Add role-based export capability to an existing enterprise application.

## Route
STANDARD

## Execution
1. Frame business need, roles, export formats, data scope, and success criteria.
2. Ground repository: auth model, permission middleware, export services, data sources, test conventions.
3. Specify functional, security, performance, and audit requirements.
4. Architect authorization checks, export job flow, storage/streaming behavior, and audit trail.
5. Challenge for privilege escalation, large export denial-of-service, data leakage, and failure recovery.
6. Decompose into permission model, service endpoint, export worker, UI, audit event, and tests.
7. Implement bounded tasks.
8. Independent review.
9. Verify acceptance matrix.
10. Release with rollback and operational validation.
