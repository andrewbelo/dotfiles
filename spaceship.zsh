# Display time
SPACESHIP_TIME_SHOW=false
SPACESHIP_USER_SHOW=false

SPACESHIP_CONDA_SHOW=false
SPACESHIP_PROMPT_PREFIXES_SHOW=false
SPACESHIP_ASYNC_SHOW=false

SPACESHIP_VENV_SYMBOL="🐍"

SPACESHIP_KUBECTL_CONTEXT_COLOR_GROUPS=(

  # else, green if "dev-01" is anywhere in the context or namespace
  green  staging

  # else, red if context name ends with ".k8s.local" _and_ namespace is "system"
  red    aws
  red    ams
  red    prod

)


# Add a custom vi-mode section to the prompt
# See: https://github.com/spaceship-prompt/spaceship-vi-mode
spaceship add --before char vi_mode
spaceship add --after git kubectl_context
