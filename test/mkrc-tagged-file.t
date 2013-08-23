  $ . "$SRC/test/helper.sh"

Passing -t should put it in a tag

  $ touch .example

  $ mkrc -t foo .example >/dev/null
  [1]

  $ assert_linked "$HOME/.example" "$HOME/.dotfiles/tag-foo/example"
