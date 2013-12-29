class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :beer_pic
      t.references :user, index: true

      t.timestamps
    end
  end
end
