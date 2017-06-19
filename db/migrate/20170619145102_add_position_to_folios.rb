class AddPositionToFolios < ActiveRecord::Migration[5.0]
  def change
    add_column :folios, :position, :integer
  end
end
