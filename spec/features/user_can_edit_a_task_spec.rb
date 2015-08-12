require 'rails_helper'

RSpec.describe 'user' do
  context 'with a list that has tasks' do
    let(:list){
      List.create(title: "Title", description: "Description")
    }

    it 'can edit a task' do
      list
      visit '/'
      click_link_or_button "Title"
      click_link_or_button "Add Task"
      fill_in 'task[title]', with: "Title"
      click_link_or_button 'Create Task'
      click_link_or_button "Edit Task"
      fill_in 'task[title]', with: "Titular"
      click_link_or_button 'Update Task'
      expect(page).to have_content("Titular")
    end
  end
end
