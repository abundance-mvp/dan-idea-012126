#!/bin/bash
# spec-gate.sh - Advisory warning when editing code without active spec
# Hook type: PreToolUse (Edit|Write)
# Exit 0: Always (advisory, non-blocking)

TOOL_INPUT="$1"

# Check if this is editing a source file (not docs, not config)
is_source_file() {
    local file="$1"
    # Skip docs, config, and test files for this check
    if echo "$file" | grep -qE "^(docs/|\.claude/|\.github/|node_modules/|__pycache__|\.git)"; then
        return 1
    fi
    # Check if it's a code file
    if echo "$file" | grep -qE "\.(js|ts|py|go|rs|java|rb|php|swift|kt)$"; then
        return 0
    fi
    return 1
}

# Check for active spec in CLAUDE.md
has_active_spec() {
    if [ -f "CLAUDE.md" ]; then
        if grep -q "Active spec: SPEC-" "CLAUDE.md"; then
            return 0
        fi
    fi
    return 1
}

# Extract file path from tool input (simplified)
FILE_PATH=$(echo "$TOOL_INPUT" | grep -oE '"file_path":\s*"[^"]+"' | sed 's/"file_path":\s*"//' | sed 's/"$//')

if [ -n "$FILE_PATH" ] && is_source_file "$FILE_PATH"; then
    if ! has_active_spec; then
        echo "Tip: No active spec found. Consider running /new-spec to create one first."
        echo "   Spec-driven development helps ensure features are well-defined before coding."
    fi
fi

exit 0
