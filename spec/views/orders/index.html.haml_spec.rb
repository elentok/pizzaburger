require 'spec_helper'

describe "orders/index" do
  before(:each) do
    assign(:orders, [
      stub_model(Order,
        :client => nil,
        :toppings => "Toppings",
        :amount => 1
      ),
      stub_model(Order,
        :client => nil,
        :toppings => "Toppings",
        :amount => 1
      )
    ])
  end

  it "renders a list of orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Toppings".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
