class BlogsController < ApplicationController
     def root
    @blog=Blog
    @users=User
  end
  
  def index
    if params[:q].present?
     @blogs=Blog.where("name = ?",params[:q])
    else
    
      @blogs=Blog.all
    
    end
  
  end
 def users
  @blog=Blog.all
 end
  def show
    @blogs=Blog.find(params[:id])

  end
  def new
    @blogs=Blog.new
  end
  def create
    @blogs=Blog.create(blog_params)
    if @blogs.save
   redirect_to blogs_path 
    else  
      render :new ,status: :unprocessable_entity
    end
end

def edit 
  @blogs=Blog.find(params[:id])
 

end
def update 
@blogs=Blog.find(params[:id])

 if  @blogs.update(blog_params)
  redirect_to blogs_path 
   else  
     render :new ,status: :unprocessable_entity
   end
end
def destroy
  @blogs=Blog.find(params[:id])
  @blogs.destroy
  redirect_to blogs_path ,notice:"blog has been created successfully"

end
private 
def blog_params
  params.require(:blog).permit(:name,:content,:user_id)
end
rescue ActivRecord::RecordNotFound => error
  redirect_to blogs_path , notice:error
end


