if [ -f "$HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh" ]; then
  source "$HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh"
  source "$HOMEBREW_PREFIX/opt/chruby/share/chruby/auto.sh"
fi

function ruby-gen-tags() {
  echo "Exporting tags..."
  ripper-tags -R -f .git/rubytags --tag-relative=yes
  ctags -R -f .git/tags --tag-relative=yes --languages=javascript
}

function ruby-install-tags() {
  which ctags >/dev/null 2>&1 || brew install ctags
  which ripper-tags >/dev/null 2>&1 || gem install ripper-tags¬
  which gem-ripper-tags >/dev/null 2>&1 || gem install gem-ripper-tags
}

BUNDLED_COMMANDS=(rescue)
