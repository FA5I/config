set -g fish_greeting

function fish_prompt
    set_color green
    printf '%s > ' (basename (prompt_pwd))
    set_color normal

    # Attempt to get the current Git branch name, suppressing errors
    set -l git_branch (git branch --show-current 2>/dev/null)
    # Check if we successfully retrieved a branch name
    if test -n "$git_branch"
        # If inside a Git repo and the branch name is not empty, print it in cyan
        set_color cyan
        echo -n "($git_branch) "

          # Reset color to normal and display the final prompt character
        set_color normal
        echo -n '> '
    else
        # If not in a Git repo or the branch name is empty, do nothing
        # This avoids showing unwanted characters or messages
    end

end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
