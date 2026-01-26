# Infrastructure-Wide SAST Standardization

This repository provides a standardized, policy-driven Static Application
Security Testing (SAST) platform for backend services, starting with Node.js.

The platform enables secure-by-default service creation by integrating SAST
into CI/CD pipelines using reusable workflows, composite actions, and
policy-as-code.

---

## Architecture Overview

The platform is structured into the following layers:

- **Workflows**: Orchestrate CI/CD execution
- **Actions**: Execute SAST scanning
- **Policies**: Define organization-wide security rules
- **Integrations**: Document secret and CI platform integration
- **Examples**: Demonstrate real backend usage
- **Docs**: Guide onboarding and remediation

---

## Supported Backends
- Node.js (primary)
- Python (planned)
- Java (planned)

---

## Getting Started
Refer to:
- `onboarding/new-service-onboarding.md`
- `examples/backend-node/`

---

## Security Model
- Scanning logic is centralized
- Policy enforcement is configurable via YAML
- Exceptions are documented and auditable

---

## SAST Tool Evaluation & Rationale

For detailed evaluation, usage guidance, and SDLC placement of SAST tools, see:

🔗 [sast-tools-evaluation](https://github.com/Asterioxer/sast-tools-evaluation)

