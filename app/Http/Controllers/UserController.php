<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Requests\StoreUserRequest;
use App\Http\Requests\UpdateUserRequest;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Validator;

class UserController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function validation(Request $request) {
        $validation = Validator::make($request->all(), [
                    'name' => 'required',
                    'email' => 'required|email',
                    'password' => 'required'
        ]);
        if ($validation->fails()) {
            return response()->json($validation->error(), 202);
        }
        $alldata = $request->all();
        $userInfo = User::where('email', '=', $alldata['email'])->first();
        $confermation['success'] = 'You are Validated';
        if (!$userInfo) {
            return response()->json($validation->error(), 202);
        } else {
            //check password
            if (Hash::check($alldata['password'], $userInfo->password)) {
                //$data=User::find($alldata[])
                return response()->json($confermation, 200);
            } else {
                return response()->json($validation->error(), 202);
            }
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
        return view('employee.customer');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreCustomerRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreUserRequest $request) {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Customer  $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user) {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Customer  $user
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user) {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateCustomerRequest  $request
     * @param  \App\Models\Customer  $user
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateUserRequest $request, User $user) {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Customer  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user) {
        //
    }

    function save(Request $request) {

        //Validate requests
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'phone' => 'required|unique:users',
            'password' => 'required|min:5|max:12'
        ]);

        //Insert data into database
        $user = new User;
        $user->name = $request->name;
        $user->email = $request->email;
        $user->phone = $request->phone;
        $user->password = Hash::make($request->password);
        $user->token = md5(uniqid(rand(), true));
        $user->verified = 0;
        $save = $user->save();

        if ($save) {
            return back()->with('success', 'New Employee has been successfuly added to database');
        } else {
            return back()->with('fail', 'Something went wrong, try again later');
        }
    }

    public function import(Request $request) {
        $path = $request->file('csv_file');
        $user = $this->csvToArray($path);

        for ($i = 0; $i < count($user); $i++) {
            $user[$i]['password'] = Hash::make($user[$i]['password']);
            $user[$i]['token'] = md5(uniqid(rand(), true));
            $user[$i]['verified'] = 0;
        }

        $save = User::insert($user);

        if ($save) {
            return back()->with('success', 'New customer(s) has been successfuly added to database');
        } else {
            return back()->with('fail', 'Something went wrong, try again later');
        }
    }

    function csvToArray($filename = '', $delimiter = ',') {
        if (!file_exists($filename) || !is_readable($filename))
            return false;

        $header = null;
        $data = array();
        if (($handle = fopen($filename, 'r')) !== false) {
            while (($row = fgetcsv($handle, 1000, $delimiter)) !== false) {
                if (!$header)
                    $header = $row;
                else
                    $data[] = array_combine($header, $row);
            }
            fclose($handle);
        }

        return $data;
    }

    function customer() {

        $data = ['customers' => User::all()];
        return view('admin.customer', $data);
    }

    function customer_search(Request $request) {
        $output = '';
        $users = User::Where('Name', 'like', '%' . $request->search . '%')
                ->orWhere('phone', 'like', '%' . $request->search . '%')
                ->orWhere('email', 'like', '%' . $request->search . '%')
                ->get();
        foreach ($users as $user) {
            $output .= '
          <tr>
          <td>' . $user->name . '</td>
          <td>' . $user->email . '</td>
          <td>' . $user->phone . '</td>
          </tr>
          ';
        }
        return response($output);
    }

}
