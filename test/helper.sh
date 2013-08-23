export HOME="$PWD"
export PATH="$SRC/bin:$PATH"
export RCRC="$HOME/.rcrc"
export RCM_LIB="$SRC/share"
mkdir .dotfiles

assert() {
  local msg="$1"; shift

  test "$@" || echo "Failed assertion: $msg"

  return 0
}

refute() {
  local msg="$1"; shift

  test "$@" && echo "Failed assertion: $msg"

  return 0
}

assert_linked() {
  local from="$1" to="$2"
  local resolved="$(readlink -f "$from")"

  assert "$from should be a symlink" -h "$from"
  assert "$from should resolve to $to, resolved to $resolved" "$resolved" = "$to"
}
