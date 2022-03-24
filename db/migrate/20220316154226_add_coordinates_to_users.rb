class AddCoordinatesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :organizations, :lat, :string
    add_column :organizations, :lon, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
