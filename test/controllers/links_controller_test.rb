require 'test_helper'

class LinksControllerTest < ActionController::TestCase

  RSpec.describe LinksController, :type => :controller do

    before :each do
      @link = Book.new(url:"http://www.google.com")
    end

    describe "GET #index" do
      it "responds successfully with an HTTP 200 status code" do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end

    describe "GET #show" do
      it "responds successfully with an HTTP 200 status code" do
        get :show
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it 'responds to slug and redirects' do
        @link = Link.new(url:"http://www.google.com")
        @link.save
        @link.sluggify!
        get :show, :slug => @link.slug
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end
    end

    describe "GET #random_link" do
      it "redirects to random URL" do
        get :random_link
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end
    end

    describe "GET #edit" do
      it "responds successfully with an HTTP 200 status code" do
        get :edit
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end

    describe "POST #create" do
      it "responds successfully with an HTTP 302 status code" do
        post :create, @link
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end
    end

    describe "PUT #update" do
      it "responds successfully with an HTTP 302 status code" do
        put :update, @link
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end
    end

    describe "DELETE #destroy" do
      it "responds successfully with an HTTP 302 redirect code" do
        delete :destroy, @link
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end
    end

  end
end
