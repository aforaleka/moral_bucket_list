class VirtuesController < ApplicationController
  
  def index
  	@virtues = Virtue.all.order(created_at: :desc)
  	# Virtue.where(public: false).each do |virtue|
  	# 	if virtue.user != current_user
  	# 		@virtues = @virtues - [virtue]
  	# 	end
  	# end
  end

  # def myvirtues
  # 	@virtues = current_user.virtues.order(created_at: :desc)
  # end

  def new
    @virtue = Virtue.new
  end

  def create
    @virtue = current_user.virtues.build(virtue_params)
    if @virtue.save
      redirect_to @virtue
    else
      render 'new'
    end
  end


  def show
    @virtue = Virtue.find params[:id]
    if (@virtue.user != current_user) && (@virtue.public == false)
      redirect_to virtues_path
    end

  end

  def edit
    @virtue = Virtue.find params[:id]
    verify_virtue_owner
  end

  def update
    @virtue = Virtue.find params[:id]
    if @virtue.update virtue_params
      redirect_to @virtue
    else
      render 'edit'
    end
  end

  def destroy
    @virtue = Virtue.find params[:id]

    if @virtue.user != current_user
        redirect_to virtue_path
        flash.alert = "Invalid Permissions"
    else 
      @virtue.destroy
      redirect_to virtues_path
      flash.notice = "Virtue successfully deleted"
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
