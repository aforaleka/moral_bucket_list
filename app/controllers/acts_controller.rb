class ActsController < ApplicationController
 @easy_access = false
  def index
    @easy_access = true
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
      @event = Event.create user_id: current_user.id, activity: "created new act", act_id: @act.id
      #current_user.acts << @act
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


   def add_to_do
    @act = Act.find(params[:id])
    if current_user.acts.include?(@act)
      if current_user.acts.where(:completed => false).include?(@act)
        redirect_to act_path(@act), :alert => "This is already on your to-do list!"
      elsif current_user.acts.where(:completed =>true).include?(@act)
        redirect_to act_path(@act), :alert => "You have already added this to your finished acts!"
      end 
    else 

      @act.completed = false
      @act.save
      @event = Event.create user_id: current_user.id, activity: "add to do", act_id: @act.id
      current_user.acts << @act
      redirect_to to_do_user_path(current_user)
    end
   
 end

 def add_to_done
    @act = Act.find(params[:id])
    if current_user.acts.include?(@act)
      if current_user.acts.where(:completed => false).include?(@act)
        redirect_to act_path(@act), :alert => "This is already on your to-do list!"
      elsif current_user.acts.where(:completed =>true).include?(@act)
        redirect_to act_path(@act), :alert => "You have already added this to your finished acts!"
      end
    else 
    @act.completed = true
    @act.save
    @event = Event.create user_id: current_user.id, activity: "add to done", act_id: @act.id
    current_user.acts << @act
    redirect_to profile_path
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
