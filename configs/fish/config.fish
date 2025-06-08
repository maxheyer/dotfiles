if status is-interactive
    # Commands to run in interactive sessions can go here
end
kubectl completion fish | source

zoxide init fish | source

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
