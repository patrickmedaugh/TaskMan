require 'rails_helper'

RSpec.describe 'user can add a task' do
  context 'with a list' do
    let(:list){
      List.create(title: "Title", description: "Description")
    }
    it 'by clicking add list' do
      list
      visit '/'
      click_link 'Add Task'
      fill_in 'task[title]', with: "Title"
      fill_in 'task[notes]', with: "Description"

      click_button 'Create Task'
      expect(page).to have_content("Description")
    end
  end
end
