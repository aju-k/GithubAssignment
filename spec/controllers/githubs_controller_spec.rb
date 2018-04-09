require 'rails_helper'

RSpec.describe GithubsController, type: :controller do

github = Github.new oauth_token: "dummy token"

    describe "GET #index" do
        
        it "connects to github"
            expect(github).should exist
        end

        it "get list of repositories"
            expect(github.repos).should exist            
        end

        it "populates array of repositories"
            expect(github.repos.list).should exist            
        end

    end

    describe "GET #show" do

        it "get parms id"
            params.has_key?(:id)
        end

    end
end
