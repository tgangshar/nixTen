# nixTen
Storage of Nix Declaratives
# FileStructure Preview
'''
nixos
|   flake.lock   #nixstore
|   flake.nix    #nix config
|   update.sh    #updates git repo
|   newUser.sh   #Creates a new user in hosts
└───home-manager #Program configs
|   |  default.nix #refrence for folder
|   └───
|
└───hosts
    └───default # users
    |   |  configuration.nix  #general enviornment and admin configs
    |   |  hardware-configuration.nix
    |   |  home.nix  #packages and programs
    |   |  todo.md
    |
    └───<new user> # User customization
        |  configuration.nix
        |  hardware-configuration.nix
        |  home.nix
'''
# Refrences
Flake.nix -> hosts/default/configuration.nix -> hardware-configuration.nix
                                             -> home-manager default   ->  home.nix  -> .../homemangaer/default.nix -> entire home manager file structure
          -> hosts/<otherUsers>
