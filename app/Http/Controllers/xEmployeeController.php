<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class EmployeeController extends Controller
{
        function save(Request $request){
        
          
        //Validate requests
        $request->validate([
            'name'=>'required',
            'email'=>'required|email|unique:admins',
            'phone'=>'required|unique:admins',
            'password'=>'required|min:5|max:12'
        ]);

         //Insert data into database
         $admin = new Admin;
         $admin->name = $request->name;
         $admin->email = $request->email;
         $admin->phone = $request->phone;
         $admin->password = Hash::make($request->password);
         $save = $admin->save();

         if($save){
            return back()->with('success','New User has been successfuly added to database');
         }else{
             return back()->with('fail','Something went wrong, try again later');
         }
            
    }
}
