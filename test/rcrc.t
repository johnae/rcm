  $ . "$SRC/test/helper.sh"

Information should be read from ~/.rcrc by default

  $ touch .example
  > mkdir .other-dotfiles

  $ echo 'DOTFILES_DIRS="$HOME/.other-dotfiles"' > $HOME/.rcrc

  $ mkrc .example
  Moving...
  '.example' -> '*/.other-dotfiles/example' (glob)
  Linking...
  '*/.example' -> '*/.other-dotfiles/example' (glob)
  [1]

  $ assert_linked "$HOME/.example" "$HOME/.other-dotfiles/example"
