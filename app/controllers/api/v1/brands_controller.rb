class Api::V1::BrandsController < Api::V1::BaseController
  def index
    @brands = Brand.all
    # @brands = Brand.order(:name).where("name like ?", "%#{params[:term]}")
    # render json: @brands.map(&:name)
  end
end
