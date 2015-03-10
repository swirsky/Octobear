require 'rails_helper'

RSpec.describe LinksController, type: :controller do
    before :all do
      @link = Link.new(url:"http://www.google.com")
      @link.save
    end

    describe "GET #index" do
      it "responds successfully with an HTTP 200 status code" do
        get :index
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end
    end

    describe "GET #show" do
      it "responds successfully with an HTTP 200 status code" do
        get :show, id:@link.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it 'responds to slug and redirects' do
        @link = Link.new(url:"http://www.google.com")
        @link.save
        get :show, :slug => @link.slug
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end
      it 'responds to bad slug and redirects to root' do
        @link = Link.new(url:"http://www.google.com")
        @link.save
        get :show, :slug => "#{@link.slug}brokenlink"
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
        expect(flash[:notice]).to be_present
      end

    end

    describe "GET #random_link" do
      it "redirects to random URL" do
        get :show, :random_link => true
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end
    end

    describe "GET #edit" do
      it "responds successfully with an HTTP 200 status code" do
        get :edit, id:@link.id
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end

    describe "POST #create" do
      it "responds successfully with an HTTP 302 status code" do
        post :create, id:@link.id, link:@link.attributes
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end
    end

    describe "PUT #update" do
      it "responds successfully with an HTTP 302 status code" do
        put :update, id:@link.id, link:@link.attributes
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end
    end

    describe "DELETE #destroy" do
      it "responds successfully with an HTTP 302 redirect code" do
        delete :destroy, id:@link.id
        expect(response).to be_redirect
        expect(response).to have_http_status(302)
      end
    end
end
