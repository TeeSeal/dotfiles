function gentags() {
  echo "Exporting tags..."
  ripper-tags -R -f .git/rubytags --tag-relative=yes
  ctags -R -f .git/tags --tag-relative=yes --languages=javascript
}

function installtags() {
  which ctags >/dev/null 2>&1 || brew install ctags 
  which ripper-tags >/dev/null 2>&1 || gem install ripper-tags¬
  which gem-ripper-tags >/dev/null 2>&1 || gem install gem-ripper-tags
}

