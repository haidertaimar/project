class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]
skip_before_action :authenticate_user!,only: [:index,:show,:edit ]
  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.paginate(page: params[:page],per_page:  5)
  end

  # GET /blogs/1 or /blogs/1.json
  def show
  end
  #timeline for the user 





    # GET /blogs/new
    def new
      @blog =   Blog.new
    end

    # GET /blogs/1/edit
    def edit
    end

  # POST /blogs or /blogs.json
  def create
    @blog = current_user.blog.new(blog_params)
    respond_to do |format|
      if @blog.save
        format.html { redirect_to blog_url(@blog), notice: "Blog was successfully created." }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    respond_to do |format|
    if (current_user.blog_ids.include?(get_id)||current_user.admin)
          if @blog.update(blog_params)
            format.html { redirect_to blog_url(@blog), notice: "Post was successfully updated." }
            format.json { render :show, status: :ok, location: @blog }
          end
        end

            format.html {  redirect_to blog_url,  notice: "You cannot Edit the Post"  }
            format.json { render json: @blog.errors, status: :unprocessable_entity }
      end

    end

  # DELETE /blogs/1 or /blogs/1.json

  def destroy

    if (current_user.blog_ids.include?(get_id)||current_user.admin)
          @blog.destroy  
              respond_to do |format|
              format.html { redirect_to blogs_url, notice: "Post was successfully destroyed." }
              format.json { head :no_content }
              end
            else
              respond_to do |format|
              format.html { redirect_to blogs_url, notice: "You are not authorized to delete this Post" }
              format.json { head :no_content }
            end
          end


    end








  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end
    def get_id
    id_of_blog_funtion= Blog.find(params[:id]).id
    end


    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :detials)
    end
end





