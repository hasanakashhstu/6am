<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Admin;
use Illuminate\Support\Facades\Hash;

class MainController extends Controller {

    function login() {
        return view('auth.login');
    }

    function register() {
        return view('auth.register');
    }

    function save(Request $request) {

        //Validate requests
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:admins',
            'phone' => 'required|unique:admins',
            'password' => 'required|min:5|max:12'
        ]);

        //Insert data into database
        $admin = new Admin;
        $admin->name = $request->name;
        $admin->email = $request->email;
        $admin->phone = $request->phone;
        $admin->password = Hash::make($request->password);
        $save = $admin->save();

        if ($save) {
            return back()->with('success', 'New User has been successfuly added to database');
        } else {
            return back()->with('fail', 'Something went wrong, try again later');
        }
    }

    function check(Request $request) {
        //Validate requests
        $request->validate([
            'value' => 'required',
            'password' => 'required|min:5|max:12',
        ]);

        $userInfo = Admin::where('email', '=', $request->value)->first();
        if (!$userInfo) {
            $userInfo = Admin::where('phone', '=', $request->value)->first();
        }


        if (!$userInfo) {
            return back()->with('fail', 'We do not recognize you');
        } else {
            //check password
            if (Hash::check($request->password, $userInfo->password)) {
                $request->session()->put('LoggedUser', $userInfo->id);
                return redirect('admin/dashboard');
            } else {
                return back()->with('fail', 'Incorrect password');
            }
        }
    }

    function logout() {
        if (session()->has('LoggedUser')) {
            session()->pull('LoggedUser');
            return redirect('/auth/login');
        }
    }

    function dashboard() {
        $data = ['LoggedUserInfo' => Admin::where('id', '=', session('LoggedUser'))->first()];
        return view('admin.dashboard', $data);
    }

    function customer() {
        return view('admin.customer');
    }

    function customer_search() {

        if ($request->ajax()) {
            $output = '';
            $query = $request->get('query');
            if ($query != '') {
                $data = DB::table('customers')
                        ->where('Name', 'like', '%' . $query . '%')
                        ->orWhere('phone', 'like', '%' . $query . '%')
                        ->orWhere('email', 'like', '%' . $query . '%')
                        ->orderBy('id', 'desc')
                        ->get();
            } else {
                $data = DB::table('customers')
                        ->orderBy('CustomerID', 'desc')
                        ->get();
            }
            $total_row = $data->count();
            if ($total_row > 0) {
                foreach ($data as $row) {
                    $output .= '
        <tr>
         <td>' . $row->name . '</td>
         <td>' . $row->email . '</td>
         <td>' . $row->phone . '</td>
        </tr>
        ';
                }
            } else {
                $output = '
       <tr>
        <td align="center" colspan="5">No Data Found</td>
       </tr>
       ';
            }
            $data = array(
                'table_data' => $output,
                'total_data' => $total_row
            );

            echo json_encode($data);
        }
    }

    function staff() {
        $data = ['LoggedUserInfo' => Admin::where('id', '=', session('LoggedUser'))->first()];
        return view('admin.staff', $data);
    }

}
