# scripts/help.sh
echo "" >&2
echo "  \033[1;36m mi proyecto \033[0m" >&2
echo "" >&2
echo "  \033[1mPerfiles disponibles:\033[0m" >&2
echo "    nix develop .#dev     — entorno de desarrollo" >&2
echo "    nix develop .#debug   — con herramientas de diagnóstico" >&2
echo "    nix develop .#ci      — pipeline CI" >&2
echo "" >&2
echo "  \033[1mCI:\033[0m" >&2
echo "    nix develop .#ci --command megalinter" >&2
echo "" >&2
