require 'rails_helper'

RSpec.describe 'create event', type: :feature do
  scenario 'with valid user and valid inputs' do
    visit new_user_registration_path
    fill_in 'Name', with: 'new user test'
    fill_in 'Username', with: 'username_test'
    fill_in 'Email', with: 'newusertest@user.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'

    visit new_event_path
    fill_in 'Title', with: 'new test event'
    fill_in 'The event details', with: 'test text'
    fill_in 'Location of the event', with: 'test location'
    fill_in 'The date of the event', with: DateTime.now
    click_on 'Create Event'

    expect(page).to have_content('Event was successfully created.')
  end

  scenario 'with valid user and invalid inputs' do
    visit new_user_registration_path
    fill_in 'Name', with: 'new user test'
    fill_in 'Username', with: 'username_test'
    fill_in 'Email', with: 'newusertest@user.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'

    visit new_event_path
    fill_in 'Title', with: 'new test event'
    fill_in 'The event details', with: ''
    fill_in 'Location of the event', with: 'test location'
    fill_in 'The date of the event', with: DateTime.now
    click_on 'Create Event'

    expect(page).to have_content('Please review the problems below:')
  end

  scenario 'with unvalid user' do
    visit new_user_registration_path
    fill_in 'Name', with: 'new user test'
    fill_in 'Username', with: ''
    fill_in 'Email', with: 'newusertest@user.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'

    visit new_event_path
    expect(page).to have_content('You have to login first')
  end
end

RSpec.describe 'show event', type: :feature do
  scenario 'going to events whitout login' do
    visit events_path
    expect(page).to have_content('Welcome To Our Event Application')
  end

  scenario 'going to events logged' do
    visit new_user_registration_path
    fill_in 'Name', with: 'new user test'
    fill_in 'Username', with: 'username_test'
    fill_in 'Email', with: 'newusertest@user.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'

    visit events_path
    expect(page).to have_content('new user test')
  end
end
