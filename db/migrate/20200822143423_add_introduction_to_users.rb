class AddIntroductionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introduction, :string
    add_column :users, :profile_image_id, :string
  end
end
