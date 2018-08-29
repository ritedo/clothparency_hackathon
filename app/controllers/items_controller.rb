class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :en_show, :scan_edit, :edit]
  LOREMIPSUM = "In fermentum ligula eget lacus vulputate, eget posuere sapien suscipit. Aliquam cursus felis diam, non sodales quam vulputate vel. Mauris ultricies dignissim est nec imperdiet. Phasellus luctus dictum velit finibus fermentum. Curabitur eleifend vehicula dapibus. Aliquam sagittis ante odio, quis gravida lectus vestibulum ut. Sed nisi leo, feugiat quis tempus id, suscipit et tortor. Curabitur et mi congue sem rutrum aliquam. Aliquam ac placerat nunc. Aenean augue nibh, malesuada vel libero et, laoreet tempor metus."
  def index
    @items = Item.all
  end
  def show
    @lorem_ipsum = LOREMIPSUM
  end
  def new
    @item = Item.new
    @materials = Material.all
  end

  def create
    if item_params[:brand]!="" && Brand.where(name: item_params[:brand]).first.nil? && Brand.where(name: item_params[:brand].capitalize).first.nil?
      redirect_to unevaluated_path
    else
      assemblies = []

      if assembly1_params[:percent].to_f > 0
        assembly1 = Assembly.new(percent: assembly1_params[:percent].to_f)
        recycled = assembly1_params[:recycled?] != nil
        assembly1.material = Material.where(name: assembly1_params[:material_name], recycled: recycled).first
        assembly1.save
        assemblies << assembly1
      end

      if assembly2_params[:percent].to_f > 0
        assembly2 = Assembly.new(percent: assembly2_params[:percent].to_f)
        recycled = assembly2_params[:recycled?] != nil
        assembly2.material = Material.where(name: assembly2_params[:material_name], recycled: recycled).first
        assembly2.save
        assemblies << assembly2
      end

      if assembly3_params[:percent].to_f > 0
        assembly3 = Assembly.new(percent: assembly3_params[:percent].to_f)
        recycled = assembly3_params[:recycled?] != nil
        assembly3.material = Material.where(name: assembly3_params[:material_name], recycled: recycled).first
        assembly3.save
        assemblies << assembly3
      end

      if assembly4_params[:percent].to_f > 0
        assembly4 = Assembly.new(percent: assembly4_params[:percent].to_f)
        recycled = assembly4_params[:recycled?] != nil
        assembly4.material = Material.where(name: assembly4_params[:material_name], recycled: recycled).first
        assembly4.save
        assemblies << assembly4
      end

      if assembly5_params[:percent].to_f > 0
        assembly5 = Assembly.new(percent: assembly5_params[:percent].to_f)
        recycled = assembly5_params[:recycled?] != nil
        assembly5.material = Material.where(name: assembly5_params[:material_name], recycled: recycled).first
        assembly5.save
        assemblies << assembly5
      end

      if assembly6_params[:percent].to_f > 0
        assembly6 = Assembly.new(percent: assembly6_params[:percent].to_f)
        recycled = assembly6_params[:recycled?] != nil
        assembly6.material = Material.where(name: assembly6_params[:material_name], recycled: recycled).first
        assembly6.save
        assemblies << assembly6
      end

      if Brand.where(name: item_params[:brand]).first
        brand = Brand.where(name: item_params[:brand]).first
      else
        brand = Brand.where(name: item_params[:brand].capitalize).first
      end
      @item = Item.new(category_id: item_params[:category_id], brand: brand, photo: item_params[:photo] )
    end
    @item.assemblies = assemblies
    if params[:item][:label]!=""
      @item.label = params[:item][:label]
    end

    if @item.save
      # reload_csv
      redirect_to item_path(@item)
    else
      category_id = @item.category.id
      @item = Item.new(category_id: category_id)
      render :new
    end
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    @item.update(category: Category.find(params[:item][:category_id]), brand_id: Brand.where(name: params[:item][:brand]).first.id)
    if params[:label] != ""
      @item.update(label: params[:item][:label])
    end
    assemblies = []
    if params[:assembly1] != nil
      assembly1 = Assembly.new(percent: assembly1_params[:percent].to_f)
      recycled = assembly1_params[:recycled?] != nil
      assembly1.material = Material.where(name: assembly1_params[:material_name], recycled: recycled).first
      assembly1.save
      assemblies << assembly1
    end

    if params[:assembly2] != nil
      assembly2 = Assembly.new(percent: assembly2_params[:percent].to_f)
      recycled = assembly2_params[:recycled?] != nil
      assembly2.material = Material.where(name: assembly2_params[:material_name], recycled: recycled).first
      assembly2.save
      assemblies << assembly2
    end

    if params[:assembly3] != nil
      assembly3 = Assembly.new(percent: assembly3_params[:percent].to_f)
      recycled = assembly3_params[:recycled?] != nil
      assembly3.material = Material.where(name: assembly3_params[:material_name], recycled: recycled).first
      assembly3.save
      assemblies << assembly3
    end

    if params[:assembly4] != nil
      assembly4 = Assembly.new(percent: assembly4_params[:percent].to_f)
      recycled = assembly4_params[:recycled?] != nil
      assembly4.material = Material.where(name: assembly4_params[:material_name], recycled: recycled).first
      assembly4.save
      assemblies << assembly4
    end

    if params[:assembly5] != nil
      assembly5 = Assembly.new(percent: assembly5_params[:percent].to_f)
      recycled = assembly5_params[:recycled?] != nil
      assembly5.material = Material.where(name: assembly5_params[:material_name], recycled: recycled).first
      assembly5.save
      assemblies << assembly5
    end

    if params[:assembly6] != nil
      assembly6 = Assembly.new(percent: assembly6_params[:percent].to_f)
      recycled = assembly6_params[:recycled?] != nil
      assembly6.material = Material.where(name: assembly6_params[:material_name], recycled: recycled).first
      assembly6.save
      assemblies << assembly6
    end
    @item.update(assemblies: assemblies)

    redirect_to item_path(@item)
  end

  private

  def reload_csv
    require 'csv'

    csv_file_path = File.expand_path('../../../db/items.csv', __FILE__)

    CSV.open(csv_file_path, 'wb') do |csv|
      csv << ['id', 'Catégorie', 'Marque', 'Label', 'carbonimpact', 'eutrophisation', 'carbonimpact_mark', 'eutrophisation_mark']
      Item.all.each do |item|
        csv << [item.id, item.category.name, item.brand, item.label, item.carbonimpact, item.eutrophisation, item.carbonimpact_mark, item.eutrophisation_mark]
      end
    end
  end

  def item_params
    params.require(:item).permit(:brand, :category_id, :photo)
  end

  def assembly1_params
    params.require(:assembly1).permit(:percent, :material_name, :recycled?)
  end

  def assembly2_params
    params.require(:assembly2).permit(:percent, :material_name, :recycled?)
  end

  def assembly3_params
    params.require(:assembly3).permit(:percent, :material_name, :recycled?)
  end

  def assembly4_params
    params.require(:assembly4).permit(:percent, :material_name, :recycled?)
  end

  def assembly5_params
    params.require(:assembly5).permit(:percent, :material_name, :recycled?)
  end

  def assembly6_params
    params.require(:assembly6).permit(:percent, :material_name, :recycled?)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
