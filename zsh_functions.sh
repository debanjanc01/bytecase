# Git branch protection - blocks commit/push on protected branches
git() {
    # Check if we're in a git repository
    if ! command git rev-parse --git-dir > /dev/null 2>&1; then
        command git "$@"
        return $?
    fi
    
    # Get current branch
    current_branch=$(command git branch --show-current 2>/dev/null)
    
    # Check if on protected branch and command is dangerous
    if [[ -n "$current_branch" ]]; then
        case "$current_branch" in
            (master|main|develop|production)
                # Check if first argument is commit or push
                if [[ "$1" == "commit" || "$1" == "push" ]]; then
                    echo ""
                    echo "🚫 BLOCKED: You're on the '$current_branch' branch!"
                    echo "   Command blocked: git $*"
                    echo "   This command is blocked to prevent accidental commits to protected branches."
                    echo ""
                    echo "   Quick fix:"
                    echo "   git checkout -b username/your-jira-or-feature-name"
                    echo ""
                    return 1
                fi
                ;;
        esac
    fi
    
    # Execute the git command normally
    command git "$@"
}
