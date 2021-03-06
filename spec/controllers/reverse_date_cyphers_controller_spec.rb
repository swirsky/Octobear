require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ReverseDateCyphersController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # ReverseDateCypher. As you add validations to ReverseDateCypher, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ReverseDateCyphersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all reverse_date_cyphers as @reverse_date_cyphers" do
      reverse_date_cypher = ReverseDateCypher.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:reverse_date_cyphers)).to eq([reverse_date_cypher])
    end
  end

  describe "GET #show" do
    it "assigns the requested reverse_date_cypher as @reverse_date_cypher" do
      reverse_date_cypher = ReverseDateCypher.create! valid_attributes
      get :show, {:id => reverse_date_cypher.to_param}, valid_session
      expect(assigns(:reverse_date_cypher)).to eq(reverse_date_cypher)
    end
  end

  describe "GET #new" do
    it "assigns a new reverse_date_cypher as @reverse_date_cypher" do
      get :new, {}, valid_session
      expect(assigns(:reverse_date_cypher)).to be_a_new(ReverseDateCypher)
    end
  end

  describe "GET #edit" do
    it "assigns the requested reverse_date_cypher as @reverse_date_cypher" do
      reverse_date_cypher = ReverseDateCypher.create! valid_attributes
      get :edit, {:id => reverse_date_cypher.to_param}, valid_session
      expect(assigns(:reverse_date_cypher)).to eq(reverse_date_cypher)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ReverseDateCypher" do
        expect {
          post :create, {:reverse_date_cypher => valid_attributes}, valid_session
        }.to change(ReverseDateCypher, :count).by(1)
      end

      it "assigns a newly created reverse_date_cypher as @reverse_date_cypher" do
        post :create, {:reverse_date_cypher => valid_attributes}, valid_session
        expect(assigns(:reverse_date_cypher)).to be_a(ReverseDateCypher)
        expect(assigns(:reverse_date_cypher)).to be_persisted
      end

      it "redirects to the created reverse_date_cypher" do
        post :create, {:reverse_date_cypher => valid_attributes}, valid_session
        expect(response).to redirect_to(ReverseDateCypher.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved reverse_date_cypher as @reverse_date_cypher" do
        post :create, {:reverse_date_cypher => invalid_attributes}, valid_session
        expect(assigns(:reverse_date_cypher)).to be_a_new(ReverseDateCypher)
      end

      it "re-renders the 'new' template" do
        post :create, {:reverse_date_cypher => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested reverse_date_cypher" do
        reverse_date_cypher = ReverseDateCypher.create! valid_attributes
        put :update, {:id => reverse_date_cypher.to_param, :reverse_date_cypher => new_attributes}, valid_session
        reverse_date_cypher.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested reverse_date_cypher as @reverse_date_cypher" do
        reverse_date_cypher = ReverseDateCypher.create! valid_attributes
        put :update, {:id => reverse_date_cypher.to_param, :reverse_date_cypher => valid_attributes}, valid_session
        expect(assigns(:reverse_date_cypher)).to eq(reverse_date_cypher)
      end

      it "redirects to the reverse_date_cypher" do
        reverse_date_cypher = ReverseDateCypher.create! valid_attributes
        put :update, {:id => reverse_date_cypher.to_param, :reverse_date_cypher => valid_attributes}, valid_session
        expect(response).to redirect_to(reverse_date_cypher)
      end
    end

    context "with invalid params" do
      it "assigns the reverse_date_cypher as @reverse_date_cypher" do
        reverse_date_cypher = ReverseDateCypher.create! valid_attributes
        put :update, {:id => reverse_date_cypher.to_param, :reverse_date_cypher => invalid_attributes}, valid_session
        expect(assigns(:reverse_date_cypher)).to eq(reverse_date_cypher)
      end

      it "re-renders the 'edit' template" do
        reverse_date_cypher = ReverseDateCypher.create! valid_attributes
        put :update, {:id => reverse_date_cypher.to_param, :reverse_date_cypher => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested reverse_date_cypher" do
      reverse_date_cypher = ReverseDateCypher.create! valid_attributes
      expect {
        delete :destroy, {:id => reverse_date_cypher.to_param}, valid_session
      }.to change(ReverseDateCypher, :count).by(-1)
    end

    it "redirects to the reverse_date_cyphers list" do
      reverse_date_cypher = ReverseDateCypher.create! valid_attributes
      delete :destroy, {:id => reverse_date_cypher.to_param}, valid_session
      expect(response).to redirect_to(reverse_date_cyphers_url)
    end
  end

end
