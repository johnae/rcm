  $ . "$SRC/test/helper.sh"

Making an rc file should move it into dotfiles and create a symlink

  $ touch .example

  $ mkrc .example
  Moving...
  '.example' -> '*/.dotfiles/example' (glob)
  Linking...
  '*/.example' -> '*/.dotfiles/example' (glob)
  [1]

  $ assert_linked "$HOME/.example" "$HOME/.dotfiles/example"

Making an rc file in a sub-directory should create the directories then
create a symlink

  $ mkdir .nested
  > touch .nested/example

  $ mkrc .nested/example
  Moving...
  '.nested/example' -> '*/.dotfiles/nested/example' (glob)
  Linking...
  '*/.nested/example' -> '*/.dotfiles/nested/example' (glob)
  [1]

  $ assert_linked "$HOME/.nested/example" "$HOME/.dotfiles/nested/example"

Making an rc file in a deeply nested sub-directory should create all of
the required directories then create a symlink

  $ mkdir .nested/deeply
  > touch .nested/deeply/example

  $ mkrc .nested/deeply/example
  Moving...
  '.nested/deeply/example' -> '*/.dotfiles/nested/deeply/example' (glob)
  Linking...
  '*/.nested/deeply/example' -> '*/.dotfiles/nested/deeply/example' (glob)
  [1]

  $ assert_linked "$HOME/.nested/deeply/example" "$HOME/.dotfiles/nested/deeply/example"
