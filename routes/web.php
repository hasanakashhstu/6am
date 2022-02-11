<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MainController;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\UserController;

/*
  |--------------------------------------------------------------------------
  | Web Routes
  |--------------------------------------------------------------------------
  |
  | Here is where you can register web routes for your application. These
  | routes are loaded by the RouteServiceProvider within a group which
  | contains the "web" middleware group. Now create something great!
  |
 */

Route::get('/', function () {
    return view('welcome');
});

Route::post('/auth/save', [MainController::class, 'save'])->name('auth.save');
Route::post('/auth/check', [MainController::class, 'check'])->name('auth.check');
Route::get('/auth/logout', [MainController::class, 'logout'])->name('auth.logout');

Route::get('/employee/save', [EmployeeController::class, 'save'])->name('employee.save');
Route::post('/employee/check', [EmployeeController::class, 'check'])->name('employee.check');
Route::get('/employee/logout', [EmployeeController::class, 'logout'])->name('employee.logout');
Route::get('/employee/dashboard', [EmployeeController::class, 'dashboard']);

Route::get('/employee/customer', [UserController::class, 'create']);
Route::get('/customer/save', [UserController::class, 'save'])->name('customer.save');
Route::Post('/customer/import', [UserController::class, 'import'])->name('customer.import');

Route::get('/customer_search', [UserController::class, 'customer_search'])->name('customer_search');

Route::get('/admin/customer', [UserController::class, 'customer']);

Route::group(['middleware' => ['AuthCheck']], function () {
    Route::get('/auth/login', [MainController::class, 'login'])->name('auth.login');
    Route::get('/auth/register', [MainController::class, 'register'])->name('auth.register');

    Route::get('/admin/dashboard', [MainController::class, 'dashboard']);

    Route::get('/admin/staff', [MainController::class, 'staff']);
});
