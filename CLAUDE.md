# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

GoBabel is a Dart CLI package for automated internationalization. It extracts hardcoded strings from Dart codebases, identifies translatable labels vs configuration strings using AI, and manages translations through a remote service.

**Status:** ❌ Not production ready yet (CLI entry point is commented out)

## Development Commands

```bash
# Install dependencies
dart pub get

# Code generation (required after model changes)
dart run build_runner build

# Watch mode for continuous code generation
dart run build_runner watch

# Analysis and formatting
dart analyze
dart format .

# Testing
dart test
```

## Architecture

### Clean Architecture with Functional Programming
- **Use Cases:** Business logic organized by feature in `lib/src/usecases/`
- **Result Pattern:** All operations return `AsyncResult<T>` using `result_dart`
- **Functional Composition:** Chain operations with `flatMap` 
- **Immutable State:** Freezed models with JSON serialization

### Core Components

**GobabelConductor (`lib/src/gobabel_conductor.dart`):**
- Main orchestrator with three flows: `create`, `sync`, `generate`
- Each flow chains multiple use cases using functional composition
- State progression tracked through flow state objects

**Flow States (`lib/src/flows_state/`):**
- `CreateFlowState`: Project creation workflow
- `SyncFlowState`: Project synchronization workflow  
- `GenerateFlowState`: Translation generation workflow

**Use Cases (`lib/src/usecases/`):**
- `analyse_codebase/`: Dart code analysis and error checking
- `arb_related/`: ARB file handling and L10n configuration
- `git_and_yaml/`: Git operations and YAML parsing
- `remote_project_related/`: API interactions with GoBabel service
- `final_resolver_function/`: Terminal operations for each flow

### Dependencies
- **Local packages:** `gobabel_core`, `gobabel_client`, `gobabel_string_extractor`
- **Key external:** `freezed`, `result_dart`, `dio`, `analyzer`, `git`

## Development Guidelines

### Code Generation
Always run `dart run build_runner build` after:
- Adding/modifying Freezed models
- Changing JSON serialization annotations
- Adding new `@freezed` classes

### Error Handling
- Use `AsyncResult<T>` for all async operations that can fail
- Chain operations with `flatMap` instead of traditional try-catch
- Return specific error types through the Result pattern
- When propagating errors from one `AsyncResult` to another with different type parameters, use `asError()` or `asErrorAsync()` extension methods from `gobabel_core` instead of `fold()`:
  ```dart
  // ✅ Good
  if (result.isError()) {
    return result.asError();
  }
  
  // ❌ Avoid
  if (result.isError()) {
    return result.fold(
      (_) => unit.toSuccess(),
      (error) => error.toFailure(),
    );
  }
  ```

### State Management
- All state objects must be immutable using Freezed
- Flow states track progress through multi-step operations
- Use `copyWith` for state updates

### Code Organization
- Group related use cases by domain/feature
- Each use case should have a single responsibility
- Prefix use case functions with flow name (e.g., `create_`, `sync_`, `generate_`)

## CLI Commands (Future Implementation)

```bash
# Create new project
go_babel create --attach-to-user-with-id="ACCOUNT_API_KEY"

# Sync existing project  
go_babel sync --api-key="YOUR_API_KEY"

# Generate translations
go_babel generate --api-key="YOUR_API_KEY" --language="en_US"
```

## Git Integration

The package heavily relies on Git for:
- Tracking file changes since last run
- Extracting project metadata (origin URL, user info)
- Determining which files need re-analysis
- Managing project versioning and commits