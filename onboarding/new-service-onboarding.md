# New Service Onboarding – SAST Enablement (Node.js)

## Purpose
This document provides step-by-step guidance for onboarding a new backend
service to the organization-wide SAST (Static Application Security Testing)
platform.

The goal is to ensure that all new services are **secure-by-default**, with
minimal setup effort and no custom security configuration.

This guide assumes **Node.js** as the primary backend language.

---

## What You Get by Onboarding
By following this guide, your service will have:
- Automated SAST scans on every push and pull request
- Centralized, organization-wide security policies
- Consistent fail / warn behavior across services
- No hardcoded secrets or custom SAST configuration
- Clear guidance on handling findings

---

## Prerequisites

Before onboarding, ensure the following:

- The service repository is hosted on GitHub
- GitHub Actions is enabled for the repository
- The service is a Node.js backend (JavaScript / TypeScript)
- A SAST token is available via GitHub Secrets (managed centrally via Vault)

---

## Repository Structure (Recommended)

A typical Node.js backend repository should resemble:

.
├── src/
│ └── server.js
├── package.json
└── .github/
└── workflows/

```yaml


SAST will scan the repository contents and does not require any
code changes to function.

---

## Step 1: Add the SAST CI Workflow

Create the following file in your repository:

.github/workflows/ci.yml


Add this content:

```yaml
name: Backend CI

on:
  push:
  pull_request:

jobs:
  sast:
    uses: <ORG>/<REPO>/.github/workflows/sast-template.yml@main
    with:
      source_path: "."
      ruleset: "p/nodejs"

  policy:
    needs: sast
    uses: <ORG>/<REPO>/.github/workflows/sast-policy-enforcement.yml

```

Replace:

- <ORG>/<REPO> with the organization and repository name hosting the
SAST platform (e.g. infrastructure-sast-standardization).

