class FoliosController < ApplicationController
  before_action :set_folio, only: [:edit, :show, :update, :destroy]
  
  def index
    @folio_items = Folio.all
  end

  def react
    @react_folio_items = Folio.react
  end
  
  def show
  end
  
  def new
    @folio_item = Folio.new
    3.times { @folio_item.technologies.build }
  end
  
  def create
    @folio_item = Folio.new(folio_params)

    respond_to do |format|
      if @folio_item.save
        format.html { redirect_to folios_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @folio_item.update(folio_params)
        format.html { redirect_to folios_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @folio_item.destroy
    respond_to do |format|
      format.html { redirect_to folios_path, notice: 'Portfolio item was successfully destroyed.' }
    end
  end
  
  private

  def set_folio
    @folio_item = Folio.find(params[:id])
  end

  def folio_params
    params.require(:folio).permit(:title, :subtitle, :body, technologies_attributes: [:name])
  end
  
end
