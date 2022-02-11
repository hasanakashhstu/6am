<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use App\Models\Admin;
use Illuminate\Http\Request;
use App\Http\Requests\StoreEmployeeRequest;
use App\Http\Requests\UpdateEmployeeRequest;
use Illuminate\Support\Facades\Hash;

class EmployeeController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreEmployeeRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreEmployeeRequest $request) {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Employee  $employee
     * @return \Illuminate\Http\Response
     */
    public function show(Employee $employee) {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Employee  $employee
     * @return \Illuminate\Http\Response
     */
    public function edit(Employee $employee) {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateEmployeeRequest  $request
     * @param  \App\Models\Employee  $employee
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateEmployeeRequest $request, Employee $employee) {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Employee  $employee
     * @return \Illuminate\Http\Response
     */
    public function destroy(Employee $employee) {
        //
    }

    function save(Request $request) {

        $data = ['LoggedUserInfo' => Admin::where('id', '=', session('LoggedUser'))->first()];

        //Validate requests
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:employees',
            'phone' => 'required|unique:employees',
            'password' => 'required|min:5|max:12'
        ]);

        //Insert data into database
        $employee = new Employee;
        $employee->admins_id = $data['LoggedUserInfo']->id;
        $employee->name = $request->name;
        $employee->email = $request->email;
        $employee->phone = $request->phone;
        $employee->password = Hash::make($request->password);
        $save = $employee->save();

        if ($save) {
            return back()->with('success', 'New Employee has been successfuly added to database');
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

        $userInfo = Employee::where('email', '=', $request->value)->first();
        
        if (!$userInfo) {
            $userInfo = Employee::where('phone', '=', $request->value)->first();
        }

        if (!$userInfo) {
            return back()->with('fail', 'We do not recognize you');
        } else {
            //check password
            if (Hash::check($request->password, $userInfo->password)) {
                $request->session()->put('LoggedUser', $userInfo->id);
                return redirect('employee/dashboard');
            } else {
                return back()->with('fail', 'Incorrect password');
            }
        } 
    }
     function dashboard(){
        $data = ['LoggedUserInfo'=>Employee::where('id','=', session('LoggedUser'))->first()];
        return view('employee.dashboard', $data);
    }
    
    function logout(){
        if(session()->has('LoggedUser')){
            session()->pull('LoggedUser');
            return redirect('');
        }
    }

}
