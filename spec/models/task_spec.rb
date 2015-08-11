require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'with valid params' do
    let(:list){
      List.create(id: 1, title: "Title")
    }

    let(:task){
      Task.create(title: "Title", status: "incomplete", notes: "I should do this thing", start_date: "February 9, 2015", due_date: "August 14, 2015", list_id: list.id )
    }

    it 'is valid' do
      expect(task).to be_valid
    end

    it 'belongs to a list' do
      expect(task.list).to eq(list)
    end
  end

  context 'without a title' do
    let(:task){
      Task.create(status: "incomplete", notes: "I should do this thing", start_date: "February 9, 2015", due_date: "August 14, 2015" )
    }

    it 'is invalid' do
      expect(task).to_not be_valid
    end
  end
end
