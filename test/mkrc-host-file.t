  $ . "$SRC/test/helper.sh"

Passing -o should put it in a host

  $ touch .example

  $ mkrc -o .example >/dev/null
  [1]

  $ assert_linked "$HOME/.example" "$HOME/.dotfiles/host-$(hostname)/example"
