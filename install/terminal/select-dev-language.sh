# Install default programming languages
if [[ -v OMAKUB_FIRST_RUN_LANGUAGES ]]; then
  languages=$OMAKUB_FIRST_RUN_LANGUAGES
else
  AVAILABLE_LANGUAGES=("Ruby on Rails" "Node.js" "Go" "PHP" "Python" "Elixir" "Rust" "Java")
  languages=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --height 10 --header "Select programming languages")
fi

if [[ -n "$languages" ]]; then
  for language in $languages; do
    case $language in
    Ruby)
      mise use --global ruby@3.3
      mise x ruby -- gem install rails --no-document
      ;;
    Node.js)
      mise use --global node@lts
      # Install npm, yarn, pnpm, bun
      yay -S --noconfirm npm yarn pnpm bun-bin
      # Install global packages
      sudo npm install -g npm-check-updates license-checker @vue/cli
      ;;
    Go)
      mise use --global go@latest
      ;;
    PHP)
      yay -Sy --noconfirm php php-sqlite php-gd php-intl
      # Install composer
      yay -S composer --needed --noconfirm
      # Enable php extensions
      sudo sed -i -E 's|;(extension.*sqlite.*)|\1|g' /etc/php/php.ini
      sudo sed -i -E 's|;(extension.*mysql.*)|\1|g' /etc/php/php.ini
      sudo sed -i -E 's|;(extension.*gd.*)|\1|g' /etc/php/php.ini
      sudo sed -i -E 's|;(extension.*intl.*)|\1|g' /etc/php/php.ini
      ;;
    Python)
      mise use --global python@latest
      ;;
    Elixir)
      mise use --global erlang@latest
      mise use --global elixir@latest
      mise x elixir -- mix local.hex --force
      ;;
    Rust)
      yay -Sy --noconfirm rust
      ;;
    Java)
      mise use --global java@latest
      ;;
    esac
  done
fi
