class CommentsController < ApplicationController
    before_action :set_comment, only: %i[edit update destroy]

    def index
        user=User.find_by(id:params[:user_id])
        @comments=user.comments

    end

    def create
        @users=User.all
        @comment_new=Comment.new(comment_params)
        @comment_new.user=User.first
        respond_to do |format|
            if @comment_new.save
                format.html { redirect_to root_path, notice: "Comment was successfully created." }
            else
                format.html { render "users/index", status: :unprocessable_entity }
            end
        end
    
    end
    
    def edit; end
    def update
        respond_to do |format|
            if @comment.update(comment_params)
                format.html { redirect_to user_comments_path(@comment.user), notice: "Comment was successfully updated." }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end

    end

    def destroy

        @comment.destroy
        redirect_to user_comments_path(@comment.user)

    end

    private
    def set_comment
        @comment = Comment.find_by(id: params[:id])
    end
    def comment_params
        params.require(:comment).permit(:body)
    end

end