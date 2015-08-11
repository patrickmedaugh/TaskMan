require 'rails_helper'

RSpec.describe List, type: :model do
  context 'with valid params' do
    let(:list){
      List.create(title: "Title", description: "Description")
    }

    it 'is valid' do
      expect(list).to be_valid
    end

    it 'has lists' do
      expect(list.tasks).to eq([])
    end
  end

  context 'without a title' do
    let(:list){
      List.create(description: "Description")
    }
    it 'is invalid' do
      expect(list).to_not be_valid
      list.title = "Title"
      expect(list).to be_valid
    end
  end
end
