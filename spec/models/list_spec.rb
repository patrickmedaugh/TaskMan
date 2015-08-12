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

    it 'can return scheduled tasks' do
      expect(list.scheduled).to eq([])
    end

    it 'can return active tasks' do
      expect(list.active).to eq([])
    end

    it 'can return all tags on a list' do
      expect(list.all_tags).to eq([])
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
