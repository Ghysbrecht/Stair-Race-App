class AddPasswordDigestToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :password, :string
  end
end
