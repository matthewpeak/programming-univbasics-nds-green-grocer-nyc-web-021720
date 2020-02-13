def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
   collection_index = 0
   while collection_index < collection.size do
    current_item = collection[collection_index]
    if ( current_item[:item] == name )
      return current_item
    end
    collection_index += 1
  end
end


def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  updated = Array.new
  cart_index = 0

  while cart_index < cart.size do
    current_item = cart[cart_index]
    if ( find_item_by_name_in_collection( current_item[:item], updated ) == nil)
      current_item[:count] = 1
      updated.push(current_item)
    else
     current_item[:count] += 1
    end
    cart_index += 1
  end
  updated
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  coupons_index = 0

  while coupons_index < coupons.size do
    applicable_for_discount = find_item_by_name_in_collection( current_coupon[:item], cart )
      if ( applicable_for_discount[:count] / current_coupon[:num] >= 1 )
        cart.push( {:item => "#{current_coupon[:item]} W/COUPON",
                    :price => (current_coupon[:cost] / current_coupon[:num]).round(2),
                    :clearance => applicable_for_discount[:clearance],
                    :count => applicable_for_discount[:count] - ( applicable_for_discount[:count] % current_coupon[:num])})

        applicable_for_discount[:count] %= current_coupon[:num]
      end
    coupons_index += 1
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
