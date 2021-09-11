require 'rails_helper'

RSpec.describe Step, type: :model do
  current_user = User.first_or_create!(email: 'test@example.com', password: 'password', password_confirmation: 'password')
  category = Category.create(intent: 'intent', user_id: current_user.id)

  def build_step
    category = Category.create(intent:'category')
    user = current_user.create(category: 'category')

  end

  it 'should not save without a title' do 
    step = Step.new(
      title: '',
      user: current_user,
      category: category
    )
    expect(step).to_not be_valid
  end

  it 'has an intent' do 
    step = Step.new(
      title: 'step',
      user: current_user,
      category: category
    )
    expect(step).to be_valid
  end
end
