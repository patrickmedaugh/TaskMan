require 'rails_helper'

RSpec.describe FiltersController, type: :controller do
  context '' do
    let(:task){
      Task.create(title: "Stuf")
    }
    it 'start_date' do
      get :start_date, :start_date => "2100-02-02", :id => "1", :format => :json
      expect(response.content_type).to eq("application/json")
    end

    it 'status' do
      get :status, :status => "completed", :id => "1",:format => :json
      expect(response.content_type).to eq("application/json")
    end

    it 'due_date' do
      get :due_date, :due_date => "2100-02-02", :id => "1", :format => :json
      expect(response.content_type).to eq("application/json")
    end

    it 'search' do
      get :search, :id => "2", :term => "things", :format => :json
      expect(response.content_type).to eq("application/json")
    end

    it 'search_tags' do
      task
      get :search_tags, :id => task.id, :format => :json
      expect(response.content_type).to eq("application/json")
    end

    it 'tags' do
      get :tags, :name => "things", :format => :json
      expect(response.content_type).to eq("application/json")
    end
  end
end
