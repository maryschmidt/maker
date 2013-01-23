require 'spec_helper'

feature 'user creates a project' do
  scenario 'with valid title and description' do
    sign_up_with 'name', 'valid@example.com', 'password'
    expect(page).to have_content('Dashboard')
    click_link 'Dashboard'
    add_project_with 'Test Project', 'Test Description'
    expect(page).to have_content('Project was successfully created')
  end

  def sign_up_with(name, email, password)
    visit sign_up_path
    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'BOO YAH'
  end

  def add_project_with(title, desc)
    click_link 'New Project'
    fill_in 'Title', with: title
    fill_in 'Description', with: desc
    click_button 'Create Project'
  end
end
