require 'rails_helper'

RSpec.describe Project, type: :model do
  current_user = User.first_or_create!(email: 'test@example.com', password: 'password', password_confirmation: 'password')
  
  it 'should not save without an RxC' do 
    project = Project.new(
      RxC: '',
      user: current_user
    )
    expect(project).to_not be_valid
  end

  it 'should have an RxC' do 
    project = Project.new(
      RxC: '609784',
      user: current_user,
      intent: 'intent'
    )
    expect(project).to be_valid
  end

  it 'should not save without an intent' do 
    project = Project.new(
      RxC: '609784',
      user: current_user,
      intent: ''
    )
    expect(project).to_not be_valid
  end

  it 'should have an intent' do 
    project = Project.new(
      RxC: '609784',
      user: current_user,
      intent: 'intent'
    )
    expect(project).to be_valid
  end

end
