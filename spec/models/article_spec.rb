require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'If title and content are entered' do
    let!(:user) do
      User.create!({
        email: 'test@example.com',
        password: 'password'
      })
    end
    
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
end
