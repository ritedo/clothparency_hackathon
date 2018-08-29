class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.where(email: params[:email]).first
    if @user.nil?
      @user = User.new(email: params[:email])
      if params[:category_id] != nil
        suscription = Suscription.new(category_id: params[:category_id])
        suscription.user = @user
        suscription.save
      elsif params[:brand_id] != nil
        brand_suscription = BrandSuscription.new(brand_id: params[:brand_id])
        brand_suscription.user = @user
        brand_suscription.save
      end
    else
      if params[:category_id] != nil
        suscription = Suscription.new(category_id: params[:category_id])
        suscription.user = @user
        suscription.save
      elsif params[:brand_id] != nil
        brand_suscription = BrandSuscription.new(brand_id: params[:brand_id])
        brand_suscription.user = @user
        brand_suscription.save
      end
    end
    if @user.save
      redirect_to registered_path
    else
      redirect_to registered_path
    end
  end
end
