# Android
if set -q TERMUX_VERSION
  
  if status is-interactive
    # Commands to run in interactive sessions can go here
  end
  
  eval (okc-ssh-agent -c)

  # The next line updates PATH for the Google Cloud SDK.
  if [ -f '/data/data/com.termux/files/home/Developer/pkg/google-cloud-sdk/path.fish.inc' ]; . '/data/data/com.termux/files/home/Developer/pkg/google-cloud-sdk/path.fish.inc'; end

  # pnpm (Android)
  set -gx PNPM_HOME "/data/data/com.termux/files/home/.local/share/pnpm"
  if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
  end                                                                            # pnpm end

else

  # Fix ruby path
  set -gx PATH /opt/homebrew/lib/ruby/gems/3.3.0/bin:$PATH

  # gcloud macOS
  source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"

  # Compilers
  # set -gx LDFLAGS "-L/usr/local/opt/llvm@5/lib"
  # set -gx CPPFLAGS "-I/usr/local/opt/llvm@5/include"
  # if which swiftenv > /dev/null; status --is-interactive; and source (swiftenv init -|psub); end
  # set -gx SWIFTENV_ROOT "$HOME/.swiftenv"

  # PGP (macOS)
  set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
  set -x GPG_TTY (tty)
  gpgconf --launch gpg-agent

  export PATH="$PATH:$HOME/.foundry/bin"

  # pnpm (macOS)
set -gx PNPM_HOME "/Users/ryan/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

end

# Restic
set -gx RESTIC_PASSWORD_FILE "$HOME/.restic"
set -gx RESTIC_REPOSITORY "/Volumes/restic"

# NVM
test -s $HOME/.nvm/nvm.fish; and source $HOME/.nvm/nvm.fish
alias ne="nvm exec -- "

# Path
set -gx PATH "$SWIFTENV_ROOT/bin" $PATH
set -gx PATH ~/Developer/bin $PATH
set -gx GOPATH ~/Developer

# Fix git
set -gx IT_TERMINAL_PROMPT 1

# Starship
starship init fish | source
