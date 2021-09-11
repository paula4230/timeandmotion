require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is database authenticable' do
    user = User.create(
      email: 'test@example.com', 
      password: 'password123',
      password_confirmation: 'password123',
      first_name:'test',
      last_name:'user',
      supervisor: 'supervisor',
      employee_id: '001236965',
      time_zone: 'UTC'
    )
    expect(user.valid_password?('password123')).to be_truthy
  end

  it 'has an email on sign up' do 
    user = User.create(
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: 'password123',
    )
  end

end
