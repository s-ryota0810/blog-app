# frozen_string_literal: true

# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2, maximum: 100 },
                    format: { with: /\A(?!\@)/ }
  validates :content, presence: true, length: { minimum: 10 }, uniqueness: true

  validate :validate_title_and_content_length
  
  belongs_to :user

  def display_created_at
    I18n.l(created_at, formats: :default)
  end

  private

  def validate_title_and_content_length
    char_count = title.length + content.length
    errors.add(:title, 'と内容は合計50文字以上で書いてください。') unless char_count > 50
  end
end
