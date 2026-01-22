#!/bin/bash
# context-loader.sh - Analyzes prompts and suggests relevant documents
# Hook type: UserPromptSubmit
# Exit 0: Always (advisory only)

PROMPT="$1"
DOCS_DIR="docs"

# Convert to lowercase for matching
PROMPT_LOWER=$(echo "$PROMPT" | tr '[:upper:]' '[:lower:]')

# Check for keywords and suggest relevant docs
suggest_docs() {
    local suggestions=""

    # API-related keywords
    if echo "$PROMPT_LOWER" | grep -qE "(api|endpoint|rest|request|response)"; then
        if [ -f "$DOCS_DIR/schemas/api-schema.md" ]; then
            suggestions="$suggestions\n- docs/schemas/api-schema.md"
        fi
    fi

    # Database-related keywords
    if echo "$PROMPT_LOWER" | grep -qE "(database|table|schema|sql|query|migration)"; then
        if [ -f "$DOCS_DIR/schemas/database-schema.md" ]; then
            suggestions="$suggestions\n- docs/schemas/database-schema.md"
        fi
    fi

    # Data model keywords
    if echo "$PROMPT_LOWER" | grep -qE "(model|entity|domain|data model)"; then
        if [ -f "$DOCS_DIR/schemas/data-model.md" ]; then
            suggestions="$suggestions\n- docs/schemas/data-model.md"
        fi
    fi

    # Spec ID pattern (SPEC-NNN)
    if echo "$PROMPT" | grep -qE "SPEC-[0-9]+"; then
        SPEC_ID=$(echo "$PROMPT" | grep -oE "SPEC-[0-9]+" | head -1)
        SPEC_FILE=$(find "$DOCS_DIR/specs" -name "${SPEC_ID}*.md" 2>/dev/null | head -1)
        if [ -n "$SPEC_FILE" ]; then
            suggestions="$suggestions\n- $SPEC_FILE"
        fi
    fi

    # Output suggestions if any
    if [ -n "$suggestions" ]; then
        echo -e "Relevant docs for context:$suggestions"
    fi
}

suggest_docs

exit 0
