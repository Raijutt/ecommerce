<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log; 

class OrderController extends Controller
{
    // Checkout - Convert Cart to Order
    public function store()
    {
        try{ 
            $cartItems = auth()->user()->cart()->with('product')->get();

            if ($cartItems->isEmpty()) {
                return response()->json(['message' => 'Cart is empty'], 400);
            }

            $totalPrice = $cartItems->sum(fn($item) => $item->product->price * $item->quantity);

            $order = Order::create([
                'user_id' => auth()->id(),
                'total_price' => $totalPrice,
            ]);

            foreach ($cartItems as $item) {
                OrderItem::create([
                    'order_id' => $order->id,
                    'product_id' => $item->product_id,
                    'quantity' => $item->quantity,
                    'price' => $item->product->price,
                ]);
            }

            // Clear the cart
            auth()->user()->cart()->delete();

            return response()->json(['message' => 'Order placed successfully', 'order' => $order]);
        }catch(\Exception $e){
            Log::error('Error, Something went wrong: ' . $e->getMessage());
            $response = [
                'success' => false,
                'message' => $e->getMessage()                
            ];              
            return response()->json($response);
        }
    }

    // View Order History
    public function index()
    {
        return auth()->user()->orders()->with('items.product')->get();
    }
}
