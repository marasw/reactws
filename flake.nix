# flake.nix, ignoring input and output
{
    description = "A description of some kind";

    inputs = {
        nixpkgs = { url = "github:NixOS/nixpkgs/nixpkgs-unstable"; }; 
        flake-utils = { url = "github:numtide/flake-utils"; };
    };

    outputs = { self, nixpkgs, flake-utils }:
        flake-utils.lib.eachDefaultSystem (system:
            let
                inherit (nixpkgs.lib) optional;
                pkgs = import nixpkgs { inherit system; };

                # git = pkgs.git;
                # nix-env -iA nixpkgs.colima
                # docker = pkgs.docker;
                # virtualisation.docker.enable
                # https://github.com/NixOS/nixpkgs/blob/nixos-23.05/pkgs/applications/virtualization/docker/default.nix#L261
                nodejs = pkgs.nodejs_20;
                pnpm = pkgs.nodePackages.pnpm;
            in
            {
                devShell = pkgs.mkShell {
                    buildInputs = [
                        # git
                        # docker
                        nodejs
                        pnpm
                    ];
                    shellHook = ''
                        echo HELLO_ECHO
                    '';
                };
            });
}

# {
#   inputs = {
#     nixpkgs = {
#       url = "github:nixos/nixpkgs/nixos-unstable";
#     };
#     flake-utils = {
#       url = "github:numtide/flake-utils";
#     };
#   };
#   outputs = { nixpkgs, flake-utils, ... }: flake-utils.lib.eachDefaultSystem (system:
#     let
#       pkgs = import nixpkgs {
#         inherit system;
#       };
#     in rec {
#       devShell = pkgs.mkShell {
#         buildInputs = with pkgs; [
#           (python3.withPackages(ps: with ps; [
#             ipython
#             jupyter
#             numpy
#             pandas
#           ]))
#         ];
#         shellHook = "jupyter notebook";
#       };
#     }
#   );
# }

# nix develop
# which node
# which pnpm
# exit

# pnpm dlx degit https://github.com/marasw/react-tailwind-basic react-tailwind-state
# pnpm dlx degit https://github.com/marasw/react-tailwind-state react-tailwind-supabase
# pnpm install

# pnpm add @supabase/supabase-js @supabase/auth-ui-react @supabase/auth-ui-shared

# pnpm add dayjs

# pnpm run dev # pnpm start ?

# _______________________________________________

# pnpm create vite@latest <app> --template react
# pnpm create vite@latest . --template react
# pnpm install

# https://github.com/Rich-Harris/degit
# pnpm dlx degit <user/project> <my-project>
# pnpm dlx degit https://github.com/vitejs/vite/packages/create-vite/template-react <my-project>

# pnpm add react-router-dom

# pnpm add tailwindcss postcss autoprefixer
# pnpm dlx tailwindcss init
# ./tailwind.config.js
# module.exports = {
# 	content: [
#     "./src/**/*.{js,jsx,ts,tsx}",
#   ],
# 	theme: {
# 	    extend: {},
# 	},
#   plugins: [],
# }
# ./index.css
# @tailwind base;
# @tailwind components;
# @tailwind utilities;

# + edit home page => taiwind test
# + github repo => degit

# pnpm add @supabase/supabase-js @supabase/auth-ui-react
# pnpm add @supabase/auth-ui-shared

# pnpm add dayjs

# pnpm run dev # pnpm start ?