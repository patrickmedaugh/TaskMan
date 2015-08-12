require 'rails_helper'

RSpec.describe SortsController, type: :controller do
 it 'title' do
  get :title, id: 1, :format => :json
  expect(response.content_type).to eq("application/json")
 end

 it 'status' do
   get :title, id: 1, :format => :json
   expect(response.content_type).to eq("application/json")
 end

 it 'due_date' do
   get :title, id: 1, :format => :json
   expect(response.content_type).to eq("application/json")
 end
end
