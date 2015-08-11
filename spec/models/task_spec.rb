require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'with valid params' do
    let(:list){
      List.create(id: 1, title: "Title")
    }

    let(:task){
      Task.create(title: "Title", status: "incomplete", notes: "I should do this thing", start_date: "August 13, 2115", due_date: "August 14, 2115", list_id: list.id )
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
      Task.create(status: "incomplete", notes: "I should do this thing", start_date: "August 13, 2115", due_date: "August 14, 2115" )
    }

    it 'is invalid' do
      expect(task).to_not be_valid
    end
  end

  context 'when dates are less than today' do
    let(:start_task) {
      Task.create(title: "Title", start_date: "February 10, 2013", due_date: "August 14, 2100")
    }

    let(:end_task){
      Task.create(title: "Title", start_date: "August 14, 2100", due_date: "August 1, 2100")
    }
    it 'is invalid on start date' do
      expect(start_task).to_not be_valid
    end

    it 'is invalid on due date' do
      expect(end_task).to_not be_valid
    end
  end
end
