#!/bin/env bash

printf "\n" >&2
printf "  \033[1;36m mi proyecto \033[0m\n" >&2
printf "\n" >&2
printf "  \033[1mPerfiles disponibles:\033[0m\n" >&2
printf "    nix develop .#dev     — entorno de desarrollo\n" >&2
printf "    nix develop .#debug   — con herramientas de diagnóstico\n" >&2
printf "    nix develop .#ci      — pipeline CI\n" >&2
printf "\n" >&2
printf "  \033[1mCI:\033[0m\n" >&2
printf "    nix develop .#ci --command megalinter\n" >&2
printf "\n" >&2
