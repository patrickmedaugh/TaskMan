require 'rails_helper'

RSpec.describe 'user can delete a list' do
  context 'with a list' do
    let(:list){
      List.create(title: "Title", description: "Description")
    }

    it 'by clicking delete list' do
      list
      visit '/'
      expect(page).to have_content("Description")
      click_link 'Title'
      click_link 'Delete List'
      expect(page).to_not have_content("Description")
    end
  end
end
