  $ . "$SRC/test/helper.sh"

mkrc should accept -r for a custom rcrc

  $ touch .example
  > mkdir .other-dotfiles

  $ echo 'DOTFILES_DIRS="$HOME/.other-dotfiles"' > alt-rcrc

  $ RCRC=./alt-rcrc mkrc .example
  Moving...
  '.example' -> '*/.other-dotfiles/example' (glob)
  Linking...
  '*/.example' -> '*/.other-dotfiles/example' (glob)
  [1]

  $ assert_linked "$HOME/.example" "$HOME/.other-dotfiles/example"
