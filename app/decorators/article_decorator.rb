# frozen_string_literal: true

module ArticleDecorator
  def author_name
    user.display_name
  end
  def display_created_at
    I18n.l(created_at, formats: :default)
  end
  
  def like_count
    self.likes.count
  end
end
