# New Relic GitLab Plugin
New Relic plugin to check the status of your GitLab installation. It connects to your GitLab installation and returns the status.

## System Requirements
- Ruby 2.0
- A New Relic account
- A GitLab installation

## Installing
- Clone this repository
- Edit `config/newrelic_plugin.yml` and update `license_key` with your New Relic key. Also modify `health_check_url` with your GitLab healthcheck url and access token.
- Execute `./newrelic_gitlab_plugin`
- Go to your New Relic plugins directory and view your GitLab health.

## Support
Please open an issue within Github

## Links
- GitLab: https://about.gitlab.com
- New Relic: http://www.newrelic.com
