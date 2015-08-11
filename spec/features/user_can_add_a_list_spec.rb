require 'rails_helper'

RSpec.describe 'user can add a list' do

  it 'by clicking add list' do
    visit '/'
    click_link 'New List'
    fill_in 'list[title]', with: "Title"
    fill_in 'list[description]', with: "Description"
    click_button 'Create List'
    expect(page).to have_content("Description")
  end
end
