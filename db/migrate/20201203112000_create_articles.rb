# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title # 短い文字列はstring
      t.text :content # 長い文字列はtext
      t.timestamps  # デフォルト
    end
  end
end
