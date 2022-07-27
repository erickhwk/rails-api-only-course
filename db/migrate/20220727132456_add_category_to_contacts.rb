class AddCategoryToContacts < ActiveRecord::Migration[6.1]
  def change
    add_reference :contacts, :category, foreign_key: true
  end
end
