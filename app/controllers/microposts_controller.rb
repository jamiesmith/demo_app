class MicropostsController < ApplicationController
  def index
    @microposts = Micropost.all
  end
  
  def show
    @micropost = Micropost.find(params[:id])
  end
  
  def new
    @micropost = Micropost.new
  end
  
  def create
    @micropost = Micropost.new(params[:micropost])
    if @micropost.save
      flash[:notice] = "Successfully created micropost."
      redirect_to @micropost
    else
      render :action => 'new'
    end
  end
  
  def edit
    @micropost = Micropost.find(params[:id])
  end
  
  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update_attributes(params[:micropost])
      flash[:notice] = "Successfully updated micropost."
      redirect_to @micropost
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    flash[:notice] = "Successfully destroyed micropost."
    redirect_to microposts_url
  end
end
