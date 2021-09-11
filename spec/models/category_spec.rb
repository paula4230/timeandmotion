require 'rails_helper'

RSpec.describe Category, type: :model do
  current_user = User.first_or_create!(email: 'test@example.com', password: 'password', password_confirmation: 'password')
  
  it 'should not save without an intent' do 
    category = Category.new(
      intent: '',
      user: current_user
    )
    expect(category).to_not be_valid
  end

  it 'has an intent' do 
    category = Category.new(
      intent: 'intent1',
      user: current_user
    )
    expect(category).to be_valid
  end

  it 'should not have a duplicate intent' do
    category = Category.new(
      intent: 'intent',
      user: current_user
    )

    category2 = Category.new(
      intent: 'intent',
      user: current_user
    )
  
    if category.intent == category2.intent
      expect(category2).to_not be_valid
    end
  end  

end
