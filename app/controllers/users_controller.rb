class UsersController < ApplicationController
    def index
        @users=User.all
        @comment_new=Comment.new
    end

end