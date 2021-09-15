class AddAffiliationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :affiliation, :string
  end
end
