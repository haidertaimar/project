class CommentController < ApplicationController

      # POST /blogs or /blogs.json

      def create
        @comment = current_user.comment.create(comment_params)
        redirect_to blog_path(params[:blog_id])
      end


      def destroy
        @blog = Blog.find(params[:blog_id])
        @comment= @blog.comment.find(params[:id])
        if (current_user.comment_ids.include?(@comment.id)|| current_user.admin)
          @comment.destroy  
              respond_to do |format|
              format.html { redirect_to blog_path(@blog), notice: "Comment Deleted" }
              format.json { head :no_content }
           
              end
          end

      end
   
      private
   
        # Only allow a list of trusted parameters through.
        def comment_params
          params.require(:comment).permit(:body).merge(blog_id: params[:blog_id])
        end
    end
    

