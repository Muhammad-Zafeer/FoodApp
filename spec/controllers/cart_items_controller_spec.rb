# spec/controllers/cart_items_controller_spec.rb

require 'rails_helper'

RSpec.describe CartItemsController, type: :controller do
  let(:cart_item) { FactoryBot.create(:cart_item) }
  let(:meal) { FactoryBot.create(:meal) }

  describe "POST #add_meal" do
    context "when both cart item and meal exist" do
      before do
        post :add_meal, params: { id: cart_item.id, meal_id: meal.id }
      end

      it "adds the meal to the cart item" do
        cart_item.reload
        expect(cart_item.meals).to include(meal)
      end

      it "updates the cart item's quantity" do
        cart_item.reload
        expect(cart_item.quantity).to eq(1)
      end

      it "updates the cart item's price" do
        cart_item.reload
        expect(cart_item.price).to eq(meal.price)
      end

      it "responds with a status code of 200 (OK)" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "when the cart item does not exist" do
      it "responds with a status code of 404 (Not Found)" do
        post :add_meal, params: { id: 999, meal_id: meal.id }
        expect(response).to have_http_status(:not_found)
      end
    end

    context "when the meal does not exist" do
      it "responds with a status code of 404 (Not Found)" do
        post :add_meal, params: { id: cart_item.id, meal_id: 999 }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
