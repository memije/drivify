class AddIncisoToAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :inciso, :string
  end
end
