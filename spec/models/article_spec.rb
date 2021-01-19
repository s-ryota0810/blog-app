require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:user) { create(:user) }
  
  context 'If title and content are entered' do
    let!(:article) { build(:article, user: user) }
  
#    before do
#      user = User.create!({
#        email: 'test@eample.com',
#        password: 'password'
#      })
#      @article = user.articles.build({
#        title: Faker::Lorem.characters(number: 10),
#        content: Faker::Lorem.characters(number: 300)
#      })      
#    end
    it 'The article can be saved' do
      expect(article).to be_valid
    end
  end
  
  context 'If the title has a single character' do
    let!(:article) { build(:article, user: user, title: Faker::Lorem.characters(number: 1)) }
    
    before do
      article.save
    end
    
    it 'The article cannot be saved' do
      expect(article.errors.messages[:title][0]).to eq('は2文字以上で入力してください')
    end
  end
end
