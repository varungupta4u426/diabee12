class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]
  before_action :set_patient_groups, only: [:new, :edit, :create, :update]
  helper_method :sort_column, :sort_direction

  # GET /blog_posts
  # GET /blog_posts.json
  def index
    @blog_posts = BlogPost.search(params[:search]).order(sort_column + " " + sort_direction)
    @sort = params[:sort]
    @direction = params[:direction] || "asc"
    @count = @blog_posts.count
    total_pages = (@count%10==0) ? (@count/10) : ((@count/10) + 1)
    @page = (params[:page] || 1).to_i
    if @page == 1
      @prev_page = false
    else
      @prev_page = true
      @prev_page_url = "/blog_posts?sort=#{params[:sort]}&direction=#{params[:direction]}&page=#{@page - 1}"
    end
    if @page==total_pages
      @next_page = false
    else
      @next_page = true
      @next_page_url = "/blog_posts?sort=#{params[:sort]}&direction=#{params[:direction]}&page=#{@page + 1}"
    end
    if @direction == "asc"
      @lower_limit = (@page-1)*10 + 1
    else
      @lower_limit = @count - (@page-1)*10
    end
    if @page == total_pages
      if @direction == "asc"
        @upper_limit = @count
      else
        @upper_limit = 1
      end
    else
      if @direction == "asc"
        @upper_limit = @page*10
      else
        @upper_limit = @lower_limit-9
      end
    end
    @blog_posts = @blog_posts.paginate(:page => @page, :per_page => 10)
  end

  # GET /blog_posts/1
  # GET /blog_posts/1.json
  def show
  end

  # GET /blog_posts/new
  def new
    @blog_post = BlogPost.new
  end

  # GET /blog_posts/1/edit
  def edit
  end

  # POST /blog_posts
  # POST /blog_posts.json
  def create
    @blog_post = BlogPost.new(blog_post_params)

    respond_to do |format|
      if @blog_post.save
        format.html { redirect_to @blog_post, notice: 'Blog Post was successfully created.' }
        format.json { render :show, status: :created, location: @blog_post }
      else
        format.html { render :new }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blog_posts/1
  # PATCH/PUT /blog_posts/1.json
  def update
    respond_to do |format|
      if @blog_post.update(blog_post_params)
        format.html { redirect_to @blog_post, notice: 'Blog Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog_post }
      else
        format.html { render :edit }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog_posts/1
  # DELETE /blog_posts/1.json
  def destroy
    @blog_post.destroy
    respond_to do |format|
      format.html { redirect_to blog_posts_url, notice: 'BlogPost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_post
      @blog_post = BlogPost.find(params[:id])
    end

    def set_patient_groups
      @patient_groups = PatientGroup.pluck(:name, :id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_post_params
      params.require(:blog_post).permit(:title, :subtitle, :url, :data, :description, :patient_group_id)
    end

  def sort_column
    BlogPost.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
