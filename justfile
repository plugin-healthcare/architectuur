# PLUGIN Architecture - Development Commands
# Requirements: pnpm, quarto, just

export PATH := "/Applications/quarto/bin:" + env("PATH")

# Default: list available commands
default:
    @just --list

# --- LikeC4 (C4 architecture diagrams) ---

# Install LikeC4 dependencies
install:
    pnpm install

# Start LikeC4 dev server (interactive diagram editor)
c4-dev:
    pnpm run dev

# Build LikeC4 static site (outputs to dist/)
c4-build:
    pnpm run build

# Export diagrams as PNG
c4-export-png:
    pnpm run export:png

# Generate React component for embedding in Quarto
c4-generate-react:
    pnpm run generate:react

# Generate relationships CSV
c4-generate-csv:
    pnpm run generate:relationships-csv

# Run LikeC4 model tests
test:
    pnpm run test

# --- Quarto (arc42 documentation book) ---

# Preview Quarto book with live reload
quarto-preview:
    cd arc42 && quarto preview

# Render Quarto book (outputs to _site/)
quarto-render:
    cd arc42 && quarto render

# --- Combined workflows ---

# Full build: LikeC4 + Quarto
build-all: c4-build quarto-render
