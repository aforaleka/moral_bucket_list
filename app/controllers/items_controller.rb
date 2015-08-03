class ItemsController < ApplicationController
  
  def index
  	@items = Item.all.order(created_at: :desc)
  	# Item.where(public: false).each do |item|
  	# 	if item.user != current_user
  	# 		@items = @items - [item]
  	# 	end
  	# end
  end

  # def myitems
  # 	@items = current_user.items.order(created_at: :desc)
  # end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to @item
    else
      render 'new'
    end
  end


  def show
    @item = Item.find params[:id]

  end

  def edit
    @item = Item.find params[:id]
  end

  def update
    @item = Item.find params[:id]
    if @item.update item_params
      redirect_to @item
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find params[:id]

  end


  private

    def item_params
      params.require(:item).permit(:public, :name)
    end



end
