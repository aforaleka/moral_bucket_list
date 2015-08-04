class ActsController < ApplicationController

  def index
    @acts = Act.all.order(created_at: :desc)
  end

  def show
    @act = Act.find(params[:id])
  end

  def new
    @act = Act.new
  end

  def create
    @act = Act.create(act_params)
    if @act.save
      current_user.acts << @act
      redirect_to act_path(@act)
    else
      render :new
    end
  end

  def destroy
    @user = current_user
    @act = @user.acts.find(params[:id])
    @user.acts.delete(@act)
    
    redirect_to '/profile'

    # if @act.user_id != current_user.id
    #     redirect_to user_path(User.find(@act.user_id))
    #     flash.alert = "Invalid Permissions"
    # else 
    #   @act.destroy
    #   redirect_to profile_path
    #   flash.notice = "Act successfully deleted"
    # end
  end

   def edit
    #verify_act_owner
    @act = current_user.acts.find(params[:id])
    
    
  end

  def update
    #verify_act_owner
    @user = current_user
    @act = @user.acts.find(params[:id])
      if @act.update(act_params)
       redirect_to profile_path
      else
       render 'edit'
      end
   end


  private

    # def verify_act_owner
    #   @act = Act.find(params[:id])
    #   if @act.user_id != current_user.id
    #     redirect_to act_path
    #     flash.alert = "Invalid Permissions"
    #   end
    # end

    def act_params
      params.require(:act).permit(:name, :blurb, :completed, :karma_points)
    end



end
