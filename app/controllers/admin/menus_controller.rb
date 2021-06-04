class Admin::MenusController < AdminController
  def index
    @menus = Menu.order('created_at ASC')
  end

  def new
    @menu ||= Menu.new
    render
  end

  def create
    @menu = Menu.new menu_params
    if @menu.save
      redirect_to admin_menus_path, notice: 'Menu was successfully created.'
    else
      render 'new'
    end
  end

  def edit
    @menu = Menu.find params[:id]
    if @menu
      render
    else
      redirect_to admin_menus_path, notice: 'Menu not found.'
    end
  end

  def update
    @menu = Menu.find params[:id]
    if @menu.update menu_params
      redirect_to admin_menus_path, notice: 'Menu was successfully updated.'
    else
      render :edit
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:default_picture, :name, :desription, :weight, :price, :status)
  end
end
