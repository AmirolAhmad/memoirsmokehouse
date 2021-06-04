class Admin::PromocodesController < AdminController
  def index
    @promocodes = Promocode.order('created_at ASC')
  end

  def new
    @promocode ||= Promocode.new
    render
  end

  def create
    @promocode = Promocode.new promocode_params
    if @promocode.save
      redirect_to admin_promocodes_path, notice: 'Promo code was successfully created.'
    else
      render 'new'
    end
  end

  def edit
    @promocode = Promocode.find params[:id]
    if @promocode
      render
    else
      redirect_to admin_promocodes_path, notice: 'Promocode not found.'
    end
  end

  def update
    @promocode = Promocode.find params[:id]
    if @promocode.update promocode_params
      redirect_to admin_promocodes_path, notice: 'Promocode was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @promocode = Promocode.find params[:id]
    if @promocode.destroy
      redirect_to admin_promocodes_path, notice: 'Promocode Deleted!'
    else
      render 'index'
    end
  end

  private

  def promocode_params
    params.require(:promocode).permit(:code, :expired_at, :status, :count, :value_percent, :fixed_amount, :limit)
  end
end