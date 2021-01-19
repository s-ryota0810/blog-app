require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'The article can be saved if title and content are entered' do
    user = User.create!({
      email: 'test@eample.com',
      password: 'password'
    })
    article = user.articles.build({
      title: Faker::Lorem.characters(number: 10),
      content: Faker::Lorem.characters(number: 300)
    })
    
    expect(article).to be_valid
  end
end
