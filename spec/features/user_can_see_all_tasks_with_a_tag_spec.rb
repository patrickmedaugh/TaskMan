require 'rails_helper'

RSpec.describe 'user' do
  context 'with a task that has tags' do
    let(:list){
      List.create(title: "Name", description: "description")
    }
    let(:task){
      Task.create(title: "Stuff", status: "incomplete", notes: "yeah buddy", start_date: "2100-01-01", due_date: "2101-01-01", list_id: list.id)
    }
    let(:tag){
      Tag.create(name: "things", task_id: task.id)
    }

    it 'can see all other tasks with that tag' do
      list;task;tag
      visit tag_path(tag)
      expect(page).to have_content("Stuff")
      expect(page).to have_content("Name")
    end
  end
end
