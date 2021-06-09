class Admin::DeliveryDatesController < AdminController
  def index
    @delivery_dates = DeliveryDate.order('created_at ASC')
  end

  def new
    @delivery_date ||= DeliveryDate.new
    render
  end

  def create
    @delivery_date = DeliveryDate.new delivery_date_params
    if @delivery_date.save
      redirect_to admin_delivery_dates_path, notice: 'DeliveryDate was successfully created.'
    else
      render 'new'
    end
  end

  def edit
    @delivery_date = DeliveryDate.find params[:id]
    if @delivery_date
      render
    else
      redirect_to admin_delivery_dates_path, notice: 'Delivery Date not found.'
    end
  end

  def update
    @delivery_date = DeliveryDate.find params[:id]
    if @delivery_date.update delivery_date_params
      redirect_to admin_delivery_dates_path, notice: 'delivery_date was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @delivery_date = DeliveryDate.find params[:id]
    if @delivery_date.destroy
      redirect_to admin_delivery_dates_path, notice: 'delivery_date Deleted!'
    else
      render 'index'
    end
  end

  def mark_inactive
    @delivery_date = DeliveryDate.find params[:id]
    if @delivery_date.update_attribute(:status, 1)
      redirect_to admin_delivery_dates_path
    else
      render 'index'
    end
  end

  private

  def delivery_date_params
    params.require(:delivery_date).permit(:date, :status)
  end
end