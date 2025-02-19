<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Log; 

class AuthController extends Controller
{
    public function register(Request $request)
    {
        try{  
            $request->validate([
                'name' => 'required|string|max:255',
                'email' => 'required|string|email|unique:users',
                'password' => 'required|min:6',
            ]);

            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => Hash::make($request->password),
            ]);
           
            return response()->json([    
                'success' => true,                
                'token' => $user->createToken('API Token')->plainTextToken,
                'name'=> $user->name,
                'email'=> $user->email
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

    public function login(Request $request)
    {
        try{  
            $request->validate([
                'email' => 'required|email',
                'password' => 'required'
            ]);

            $user = User::where('email', $request->email)->first();

            if (!$user || !Hash::check($request->password, $user->password)) {
                throw ValidationException::withMessages([
                    'email' => ['The provided credentials are incorrect.'],
                ]);
            }

            return response()->json([               
                'success' => true,                
                'token' => $user->createToken('API Token')->plainTextToken,
                'name'=> $user->name
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

    public function logout(Request $request)
    {
        try{ 
            $request->user()->tokens()->delete();          
            return response()->json([               
                'success' => true,                
                'message' => 'Logged out'
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
}
