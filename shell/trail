trail() {
  if [ -z "$1" ]; then
    echo "Usage: trail <file> <filter 1> <filter 2> ..."
    return 1
  fi

  file="$1"
  shift

  if [ $# -eq 0 ]; then
    tail -F "$file"
  else
    filters=()
    for filter in "$@"; do
      filters+=("-e" "$filter")
    done

    tail -F "$file" | grep -iv "${filters[@]}"
  fi
}
