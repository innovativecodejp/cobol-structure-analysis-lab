# Component Catalog Configuration

## Purpose

This configuration defines the allowed component types for migration validation.
When a component type is not in `STANDARD_CATALOG_COMPONENTS` or `COMPONENT_ALIAS_MAP`,
the system reports `UNKNOWN_COMPONENT` and falls back to text display.

## Usage

1. **Direct import**: If your validation tool supports JSON config, load `component-catalog.json`.
2. **Manual sync**: Copy the arrays/map into your project's validator constants.
3. **Path reference**: Configure your tool to read from `config/component-catalog.json`.

## Resolving UNKNOWN_COMPONENT

To allow a new component (e.g., `am-crowd-layer-scene-selector`):

- Add to `STANDARD_CATALOG_COMPONENTS`, or
- Add to `COMPONENT_ALIAS_MAP` (alias → canonical name).

## Current Additions

- `am-crowd-layer-scene-selector` (for selector component)
- Aliases: `CrowdLayerSceneSelector`, `selector`
