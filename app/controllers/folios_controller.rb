class FoliosController < ApplicationController
  def index
    @folio_items = Folio.all
  end
  
  def new
    @folio_item = Folio.new
  end
  
  def create
    @folio_item = Folio.new(params.require(:folio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @folio_item.save
        format.html { redirect_to folios_path, notice: 'Your portfolio item is now live.' }
      else
        formate.html { render :new }
      end
    end
  end
  
end
