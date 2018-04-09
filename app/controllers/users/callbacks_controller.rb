class Users::CallbacksController < ApplicationController

    skip_before_filter :authenticate_user!  

    def github
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in(@user)
        redirect_to githubs_path
    end
    

end
