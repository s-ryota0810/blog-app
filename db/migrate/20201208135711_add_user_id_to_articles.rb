class AddUserIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :user #user_idをarticleモデルに追加するのと同じ意味
    #add_column :articles, :user_id, :integer
  end
end
