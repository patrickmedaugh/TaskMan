require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  it 'create' do
    get :create, :id => 1, :name => "Gerald", :format => :json
    expect(response.content_type).to eq("application/json")
  end
end
