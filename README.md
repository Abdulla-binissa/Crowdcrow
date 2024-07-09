# Project Structure

This document outlines the structure of the Godot game project, detailing the purpose of each directory and its contents.

## Current Project Structure

```plaintext
/project_root
├── assets/                      # Images, models, audio, etc.
│   ├── images/                  # Image files
│   │   ├── ui/                  # UI images and icons
│   ├── models/                  # 3D models
│   │   ├── environment/         # Environment models (trees, rocks, etc.)
│   |   │   ├── tiles/           # Hex tiles
├── scenes/                      # Scene files
│   ├── ui/                      # Scebe for UI elements
|   |   ├── level_editor/        # Scene for the level editor
├── scripts/                     # GDScript files
│   ├── ui/                      # Scripts for UI elements
|   |   ├── level_editor/        # Scripts for the level editor
└── resources/                   # Resource files, including `.tres` and `.res`
    └── levels/                  # All the levels 
```

## Example Project Structure

```plaintext
/project_root
├── addons/                      # Godot plugins and addons
│   └── plugin_name/             # Specific plugin directory
├── assets/                      # Images, models, audio, etc.
│   ├── images/                  # Image files
│   │   ├── ui/                  # UI images and icons
│   │   ├── textures/            # Textures for models
│   │   └── sprites/             # Sprite images for 2D elements
│   ├── models/                  # 3D models
│   │   ├── characters/          # Character models
│   │   ├── environment/         # Environment models (trees, rocks, etc.)
│   │   └── props/               # Props models (items, furniture, etc.)
│   └── audio/                   # Audio files
│       ├── music/               # Background music
│       └── sfx/                 # Sound effects
├── scenes/                      # Scene files
│   ├── levels/                  # Level scene files
│   ├── ui/                      # UI scene files
│   └── characters/              # Character scene files
├── scripts/                     # GDScript files
│   ├── ui/                      # Scripts for UI elements
│   │   ├── main_menu.gd         # Main menu script
│   │   ├── hud.gd               # HUD script
│   │   └── pause_menu.gd        # Pause menu script
│   ├── gameplay/                # Scripts for gameplay mechanics
│   │   ├── player.gd            # Player script
│   │   ├── enemy.gd             # Enemy script
│   │   ├── item.gd              # Item script
│   │   └── tile.gd              # Tile script
│   └── utilities/               # Utility scripts
│       ├── grid_manager.gd      # Grid management script
│       ├── pathfinding.gd       # Pathfinding script
│       └── helpers.gd           # Helper functions
└── resources/                   # Resource files, including `.tres` and `.res`
    ├── materials/               # Material resources
    │   ├── shaders/             # Shader materials
    │   └── standard/            # Standard materials
    ├── prefabs/                 # Prefabricated objects
    └── data/                    # Data resources
        ├── tile_data.tres       # Tile data resource
        └── level_data.tres      # Level data resource
