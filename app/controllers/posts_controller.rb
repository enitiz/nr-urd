class PostsController < ApplicationController
	# Devise filter that checks for an authenticated member
	before_filter :authenticate_member!
	
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.find(:all, :order => 'up_votes desc, down_votes, created_at desc')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all(:order => 'up_votes desc, down_votes, created_at')
    @comment = @post.comments.new
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])    
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
		@post.member_id = current_member.id if @post.member_id.nil?
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
		
		respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      elsif :comments
        format.html { render action: "show", notice: 'Comment cant be blank' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
  
  def upvote
  	@post = Post.find(params[:id])
  	current_member.up_vote!(@post)
  	redirect_to :back
  end
 
  def downvote
  	@post = Post.find(params[:id])
  	current_member.down_vote!(@post)
  	redirect_to :back
  end
  
  def unvote
  	@post = Post.find(params[:id])
  	current_member.unvote!(@post)
  	redirect_to :back
  end 

  def upvotecom
  	@comment = Comment.find(params[:id])
  	current_member.up_vote!(@comment)
  	redirect_to :back
  end
 
  def downvotecom
  	@comment = Comment.find(params[:id])
  	current_member.down_vote!(@comment)
  	redirect_to :back
	end
  
  def unvotecom
  	@comment = Comment.find(params[:id])
  	current_member.unvote!(@comment)
  	redirect_to :back
	end 
end
