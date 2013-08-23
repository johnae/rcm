  $ . "$SRC/test/helper.sh"
  > mkdir .other-dotfiles

Passing -d should specify alternate dotfiles location

  $ touch .example

  $ mkrc -d .other-dotfiles .example  >/dev/null
  [1]

  $ assert_linked "$HOME/.example" "$HOME/.other-dotfiles/example"
