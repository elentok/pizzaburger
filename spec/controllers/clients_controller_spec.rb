require 'spec_helper'

describe ClientsController do

  let (:valid_attributes) { FactoryGirl.attributes_for :client } 

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ClientsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all clients as @clients" do
      client = FactoryGirl.create :client
      get :index, {}, valid_session
      assigns(:clients).should eq([client])
    end
  end

  describe "GET show" do
    it "assigns the requested client as @client" do
      client = FactoryGirl.create :client
      get :show, {:id => client.to_param}, valid_session
      assigns(:client).should eq(client)
    end
  end

  describe "GET new" do
    it "assigns a new client as @client" do
      get :new, {}, valid_session
      assigns(:client).should be_a_new(Client)
    end
  end

  describe "GET edit" do
    it "assigns the requested client as @client" do
      client = FactoryGirl.create :client
      get :edit, {:id => client.to_param}, valid_session
      assigns(:client).should eq(client)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Client" do
        expect {
          post :create, {:client => valid_attributes}, valid_session
        }.to change(Client, :count).by(1)
      end

      it "assigns a newly created client as @client" do
        post :create, {:client => valid_attributes}, valid_session
        assigns(:client).should be_a(Client)
        assigns(:client).should be_persisted
      end

      it "redirects to the created client" do
        post :create, {:client => valid_attributes}, valid_session
        response.should redirect_to(Client.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved client as @client" do
        # Trigger the behavior that occurs when invalid params are submitted
        Client.any_instance.stub(:save).and_return(false)
        post :create, {:client => {}}, valid_session
        assigns(:client).should be_a_new(Client)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Client.any_instance.stub(:save).and_return(false)
        post :create, {:client => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested client" do
        client = FactoryGirl.create :client
        # Assuming there are no other clients in the database, this
        # specifies that the Client created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Client.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => client.to_param, :client => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested client as @client" do
        client = FactoryGirl.create :client
        put :update, {:id => client.to_param, :client => valid_attributes}, valid_session
        assigns(:client).should eq(client)
      end

      it "redirects to the client" do
        client = FactoryGirl.create :client
        put :update, {:id => client.to_param, :client => valid_attributes}, valid_session
        response.should redirect_to(client)
      end
    end

    describe "with invalid params" do
      it "assigns the client as @client" do
        client = FactoryGirl.create :client
        # Trigger the behavior that occurs when invalid params are submitted
        Client.any_instance.stub(:save).and_return(false)
        put :update, {:id => client.to_param, :client => {}}, valid_session
        assigns(:client).should eq(client)
      end

      it "re-renders the 'edit' template" do
        client = FactoryGirl.create :client
        # Trigger the behavior that occurs when invalid params are submitted
        Client.any_instance.stub(:save).and_return(false)
        put :update, {:id => client.to_param, :client => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested client" do
      client = FactoryGirl.create :client
      expect {
        delete :destroy, {:id => client.to_param}, valid_session
      }.to change(Client, :count).by(-1)
    end

    it "redirects to the clients list" do
      debugger
      client = FactoryGirl.create :client
      delete :destroy, {:id => client.to_param}, valid_session
      response.should redirect_to(clients_url)
    end
  end

end
