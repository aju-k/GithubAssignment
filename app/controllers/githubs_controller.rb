class GithubsController < ApplicationController

    # /list Get list of repositories 
    def list
        github = current_user.login_github
        @list = []
        if github.present?
            @list = github.repos.list rescue []
        end
    end

    # repo/id Get repo details
    def details
        if params["id"].present?
           github = current_user.login_github
           @project = github.repos.get_by_id(params["id"]) rescue ''
           if @project.present?
               @chartData =  GithubApis.get_datewise_commits(current_user, github, @project, params["daterange"])
           end
        end
    end
end
