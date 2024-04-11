class AddLocaleToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :locale, :string, default: 'mk'
  end
end
