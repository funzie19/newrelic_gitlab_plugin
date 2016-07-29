#! /usr/bin/env ruby

# This is a simple health check for GitLab using it's given health check end point

require "rubygems"
require "bundler/setup"
require 'net/http'
require 'json'
require "newrelic_plugin"

module GitlabAgent

  class Agent < NewRelic::Plugin::Agent::Base

    agent_guid "com.hostedcgi.gitlab"
    agent_version "1.0.0"
    agent_config_options :health_check_url  
    agent_human_labels("GilLab Health Check") { "GitLab Health" }

    def poll_cycle      
      resp = Net::HTTP.get_response(URI.parse(health_check_url))
      data = resp.body
      result = JSON.parse(data)

      if result['healthy'] == true
        @healthy=1
      else
        @healthy=0
      end

      report_metric "Overall Health", "Status", @healthy
    end

  end

  NewRelic::Plugin::Setup.install_agent :gitlab, GitlabAgent

  #
  # Launch the agent; this never returns.
  #
  NewRelic::Plugin::Run.setup_and_run

end
