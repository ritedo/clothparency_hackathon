class AssembliesController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @assembly = Assembly.new
  end

  def create
    @assembly = Assembly.new(assembly_params)
    @assembly.item = Item.find(params[:item_id])
    @assembly.save
    redirect_to item_path(@assembly.item)
  end

  private

  def assembly_params
    params.require(:assembly).permit(:percent, :material)
  end
end
