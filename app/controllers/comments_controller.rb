class CommentsController < ApplicationController


    def create
    @comment = Comment.new(comment_params)
     if @comment.save
        redirect_to feed_path
      else
        redirect_to request.referrer
      end
    end
    def edit
      @meetup = Meetup.find(params[:meetup_id])
      @comment = Comment.find(params[:id])
    end

    def update
      @comment = Comment.find(params[:id])
      if @comment.update(comment_params)
         redirect_to feed_path
       else
         redirect_to request.referrer
       end
    end
    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to feed_path
    end

   private


   def comment_params
     params.require(:comment).permit(:body, :user_id, :meetup_id)
   end

end
