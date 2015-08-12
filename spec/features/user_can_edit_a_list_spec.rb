require 'rails_helper'

RSpec.describe 'user' do
  context 'with a list' do
    let(:list){
      List.create(title: "Listy", description: "listical")
    }
    it 'can edit a list' do
      visit edit_list_path(list)
      fill_in 'list[title]', with: "Listerine"
      click_link_or_button 'Update List'
      expect(page).to have_content("Listerine")
    end
  end
end
