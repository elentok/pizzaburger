require 'spec_helper'

describe "orders/edit" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :client => nil,
      :toppings => "MyString",
      :amount => 1
    ))
  end

  it "renders the edit order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => orders_path(@order), :method => "post" do
      assert_select "input#order_client", :name => "order[client]"
      assert_select "input#order_toppings", :name => "order[toppings]"
      assert_select "input#order_amount", :name => "order[amount]"
    end
  end
end
