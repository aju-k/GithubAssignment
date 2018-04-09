class GithubsController < ApplicationController

    before_action :login_github
    
    # /githubs Get list of repositories 
    def index
        @list = @github&.repos&.list
    end

    # github/id Get repo details
    def show
        if params["id"].present?
            @project = @github&.repos&.get_by_id(params["id"]) 
            if @project.present?
                @chartData = GithubApis.get_datewise_commits(current_user, @github, @project, params["daterange"])
            end
        end
    end

    private

    def login_github
        @github = current_user.login_github
    end
end
