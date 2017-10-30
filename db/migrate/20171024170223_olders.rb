class Olders < ActiveRecord::Migration
  def change
    create_table :Olders do |t|
    t.string :company
    t.text :item
    t.text :description
    t.string :line_location
    t.string :machiens
    t.timestamps 
   
  end
  end
end

