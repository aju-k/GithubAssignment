require 'rails_helper'

RSpec.describe GithubApis, type: :controller do

github = Github.new oauth_token: "dummy token"

    describe "GET datewise records" do

        it "get commits"
            expect(github.repos.commits).should exist            
        end

        it "populates list of commits"
            expect(github.repos.commits).should exist            
        end

    end

    
end
