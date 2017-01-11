packages=(
  serverless
)

# Update npm and install global modules.
function npm_install() {
  local installed modules
  e_header "Updating npm"
  npm update -g npm
  { pushd "$(npm config get prefix)/lib/node_modules"; installed=(*); popd; } >/dev/null
  modules=($(setdiff "${packages[*]}" "${installed[*]}"))
  if (( ${#modules[@]} > 0 )); then
    e_header "Installing Npm modules: ${modules[*]}"
    npm install -g "${modules[@]}"
  fi
}

npm_install

