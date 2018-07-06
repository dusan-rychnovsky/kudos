require 'rails_helper'

RSpec.describe KudosController, type: :controller do
  it "handles a missing kudos correctly" do
    get :show, params: { id: "not-here" }

    expect(response).to redirect_to(kudos_path)
    message = "The Kudos you were looking for could not be found."
    expect(flash[:alert]).to eq message
  end
end
