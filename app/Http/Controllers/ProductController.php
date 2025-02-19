<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log; 

class ProductController extends Controller
{
    public function index()
    {      
        try{ 
            return response()->json([               
                'success' => true,                
                'data' => Product::all()
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

    public function store(Request $request)
    {
        
        
        try{ 
            $request->validate([
                'name' => 'required',
                'description' => 'required',
                'price' => 'required|numeric',
                'stock' => 'required|integer',
            ]);

            return response()->json([               
                'success' => true,                
                'message' => 'Product created',
                'data' => Product::create($request->all())
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

    public function show(Product $product)
    {
        return $product;
    }

    public function update(Request $request, Product $product)
    {
       
        try{
            Log::info('Request Data:', $request->all());

            $product->update($request->all());           

            return response()->json([               
                'success' => true,                
                'message' => 'Product Updated',
                'data' => $product
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

    public function destroy(Product $product)
    {
        $product->delete();
        return response()->json(['message' => 'Deleted successfully']);
    }
}
