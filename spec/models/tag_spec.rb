require 'rails_helper'

RSpec.describe Tag, type: :model do
  context 'with valid params' do
    let(:task){
      Task.create(title: "tasktitle", start_date: "2-2-2100", due_date: "3-3-2100")
    }
    let(:tag){
      Tag.create(name: "tagtitle", task_id: task.id)
    }
    it 'is valid' do
      expect(tag).to be_valid
    end

    it 'belongs to a task' do
      expect(tag.task.title).to eq("tasktitle")
    end
  end
end
