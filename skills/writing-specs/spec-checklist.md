# Spec Edge Case Checklist

## Input Validation
- [ ] Empty input
- [ ] Null/undefined input
- [ ] Maximum length input
- [ ] Minimum length input
- [ ] Special characters
- [ ] Unicode/emoji
- [ ] SQL injection attempts
- [ ] XSS attempts

## Authentication/Authorization
- [ ] Unauthenticated user
- [ ] Expired token
- [ ] Insufficient permissions
- [ ] Admin vs regular user
- [ ] Rate limiting

## Data States
- [ ] Empty state (no data)
- [ ] Single item
- [ ] Many items (pagination)
- [ ] Maximum items
- [ ] Deleted/archived items
- [ ] Draft vs published

## Timing/Concurrency
- [ ] Simultaneous requests
- [ ] Race conditions
- [ ] Timeout scenarios
- [ ] Retry behavior

## Error Scenarios
- [ ] Network failure
- [ ] Database unavailable
- [ ] Third-party API failure
- [ ] Partial failure (some succeed, some fail)

## Business Rules
- [ ] Boundary values
- [ ] State transitions
- [ ] Cascading effects
