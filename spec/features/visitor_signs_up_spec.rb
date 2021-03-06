require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'name', 'valid@example.com', 'password'
    expect(page).to have_content('Sign out')
  end

  scenario 'with invalid email' do
    sign_up_with 'name', 'invalid_email', 'password'
    expect(page).to have_content('Share your craft')
  end

  scenario 'with blank password' do
    sign_up_with 'name', 'valid@example.com', ''
    expect(page).to have_content('Share your craft')
  end

  scenario 'with blank name' do
    sign_up_with '', 'valid@example.com', 'password'
    expect(page).to have_content('Share your craft')
  end

  def sign_up_with(name, email, password)
    visit sign_up_path
    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'BOO YAH'
  end
end
