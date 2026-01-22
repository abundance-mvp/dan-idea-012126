---
title: API Schema
created: YYYY-MM-DD
updated: YYYY-MM-DD
version: 1.0.0
base_url: /api/v1
---

# API Schema

## Overview

[Description of the API]

## Authentication

[How authentication works]

## Endpoints

### Resource: [ResourceName]

#### GET /resource

**Description:** [What it does]

**Request:**
- Headers: `Authorization: Bearer <token>`
- Query params:
  - `limit` (optional): Number of items (default: 20)
  - `offset` (optional): Pagination offset

**Response:**
```json
{
  "data": [],
  "meta": {
    "total": 0,
    "limit": 20,
    "offset": 0
  }
}
```

**Errors:**
| Code | Description |
|------|-------------|
| 401 | Unauthorized |
| 404 | Not found |

#### POST /resource

**Description:** [What it does]

**Request:**
```json
{
  "field": "value"
}
```

**Response:** `201 Created`
```json
{
  "id": "uuid",
  "field": "value"
}
```

## Error Format

All errors follow this format:
```json
{
  "error": {
    "code": "ERROR_CODE",
    "message": "Human readable message"
  }
}
```
