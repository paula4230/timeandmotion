require 'rails_helper'

RSpec.describe Phase, type: :model do
  current_user = User.first_or_create!(email: 'test@example.com', password: 'password', password_confirmation: 'password')
  project = Project.first_or_create!(RxC: 'project', intent:'intent', user_id: current_user.id)

  it 'should not save without an step' do 
    phase = Phase.new(
      step: '',
      project_id: project.id,
      user: current_user
    )
    expect(phase).to_not be_valid
  end

  it 'has a step' do 
    phase = Phase.new(
      step: 'step',
      project_id: project.id,
      user: current_user
    )
    expect(phase).to be_valid
  end

  it 'can add a start time for each phase' do 
    phase = Phase.new(
      step: 'step',
      project_id: project.id,
      user: current_user
    )

    phase.start_time = Time.current

    expect(phase).to be_valid

  end

  it 'can add an end time for each phase' do 
    phase = Phase.new(
      step: 'step',
      project_id: project.id,
      user: current_user
    )

    phase.end_time = Time.current

    expect(phase).to be_valid

  end

  it 'can calculate duration in minutes for each of the phases' do 
    phase = Phase.new(
      step: 'step',
      project_id: project.id,
      user: current_user,
      start_time: Time.new(2021, 9, 11, 8, 41, 0),
      end_time: Time.new(2021, 9, 11, 8, 45, 0)
    )

    phase.durationinmin = (phase.end_time - phase.start_time)

    expect(phase).to be_valid
  end

  it 'can calculate duration in minutes for each of the phases and convert it to hours for the projects hours_spent' do 
    phase = Phase.new(
      step: 'step',
      project_id: project.id,
      user: current_user,
      start_time: Time.new(2021, 9, 11, 8, 41, 0),
      end_time: Time.new(2021, 9, 11, 8, 45, 0),
    )

    phase2 = Phase.new(
      step: 'step2',
      project_id: project.id,
      user: current_user,
      start_time: Time.new(2021, 9, 11, 8, 41, 0),
      end_time: Time.new(2021, 9, 11, 8, 45, 0),
    )

    phase2.durationinmin = (phase.end_time - phase.start_time)
    phase.durationinmin = (phase.end_time - phase.start_time)

    totalmin = phase.durationinmin + phase2.durationinmin

    project.hours_spent = totalmin/60

    expect(project).to be_valid
  end

end
