<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log; 
use Illuminate\Support\Facades\DB;


class CartController extends Controller
{
    
    // View Cart Items
    public function index()
    {
        
        try{ 
            return response()->json([               
                'success' => true,                
                'data' => auth()->user()->cart()->with('product')->get()
            ]);
        }catch(\Exception $e){
            Log::error('Error, Something went wrong: ' . $e->getMessage());
            $response = [
                'success' => false,
                'message' => $e->getMessage()                
            ];              
            return response()->json($response);
        }
    }

    // Add Product to Cart
    public function store(Request $request)
    {
        try{ 
            $request->validate([
                'product_id' => 'required|exists:products,id',
                'quantity' => 'required|integer|min:1',
            ]);

            $cartItem = Cart::updateOrCreate(
                ['user_id' => auth()->id(), 'product_id' => $request->product_id],
                ['quantity' => DB::raw("quantity + {$request->quantity}")]
            );

            return response()->json(['message' => 'Product added to cart', 'cart' => $cartItem]);
        }catch(\Exception $e){
            Log::error('Error, Something went wrong: ' . $e->getMessage());
            $response = [
                'success' => false,
                'message' => $e->getMessage()                
            ];              
            return response()->json($response);
        }
    }

    // Update Quantity
    public function update(Request $request, Cart $cart)
    {
        try{
            Log::info('Auth User ID:', ['id' => auth()->id()]);
            Log::info('Cart User ID:', ['id' => $cart->user_id]);
            
            if(auth()->id() != $cart->user_id)
            {
                
                $response = [
                    'success' => false,
                    'message' => 'Unauthorized.'               
                ];              
                return response()->json($response);
            }
            $request->validate(['quantity' => 'required|integer|min:1']);

            $cart->update(['quantity' => $request->quantity]);
            return response()->json(['message' => 'Cart updated']);
        }catch(\Exception $e){
            Log::error('Error, Something went wrong: ' . $e->getMessage());
            $response = [
                'success' => false,
                'message' => $e->getMessage()                
            ];              
            return response()->json($response);
        }
    }

    // Remove Item from Cart
    public function destroy(Cart $cart)
    {
        try{
            if(auth()->id() != $cart->user_id)
            {
                $response = [
                    'success' => false,
                    'message' => 'Unauthorized.'               
                ];              
                return response()->json($response);
            }
          
            $cart->delete();
            return response()->json(['message' => 'Item removed']);
        }catch(\Exception $e){
            Log::error('Error, Something went wrong: ' . $e->getMessage());
            $response = [
                'success' => false,
                'message' => $e->getMessage()                
            ];              
            return response()->json($response);
        }
    }
}
