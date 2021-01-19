require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:user) do
    User.create!({
      email: 'test@example.com',
      password: 'password'
    })
  end
  
  context 'If title and content are entered' do
    let!(:article) do
      user.articles.build({
        title: Faker::Lorem.characters(number: 10),
        content: Faker::Lorem.characters(number: 300)
      })
    end
  
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
    let!(:article) do
      user.articles.create({
        title: Faker::Lorem.characters(number: 1),
        content: Faker::Lorem.characters(number: 300)
      })
    end
    it 'The article cannot be saved' do
      expect(article.errors.messages[:title][0]).to eq('は2文字以上で入力してください')
    end
  end
end
