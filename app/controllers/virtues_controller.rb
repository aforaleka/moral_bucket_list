class VirtuesController < ApplicationController
  def create
    @user = current_user
    @virtue = @user.virtues.create(virtue_params)
    redirect_to profile_path
  end

  def destroy

    @virtue = Virtue.find params[:id]

    if @virtue.user_id != current_user.id
        redirect_to user_path(User.find(@virtue.user_id))
        flash.alert = "Invalid Permissions"
    else 
      @virtue.destroy
      redirect_to profile_path
      flash.notice = "Virtue successfully deleted"
    end
  end


  def edit
    verify_virtue_owner
    @virtue = Virtue.find params[:id]
    
  end

  def update
    verify_virtue_owner
    @user = current_user
    @virtue = Virtue.find params[:id]
    if @virtue.update(virtue_params)
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  


  private

    def verify_virtue_owner
      if @virtue.user_id != current_user.id
        redirect_to virtue_path
        flash.alert = "Invalid Permissions"
      end
    end

    def virtue_params
      params.require(:virtue).permit(:public, :title, :description)
    end



end
