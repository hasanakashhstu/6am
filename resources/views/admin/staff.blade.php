<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Register</title>
        <link rel="stylesheet" href="{{ asset('bootstrap-3.1.1/css/bootstrap.min.css') }}">
    </head>
    <body>
        <div>
            <div class="container" style="margin-top: 10px;">
                <p><a href="/admin/dashboard">Dashboard</a></p>
            </div>
        </div>
        <div class="container">
            <div class="row" style="margin-top:45px">
                <div class="col-md-4 col-md-offset-4">
                    <h4>Create New Employee</h4><hr>
                    <form action="{{ route('employee.save') }}" method="get">
                        @if(Session::get('success'))
                        <div class="alert alert-success">
                            {{ Session::get('success') }}
                        </div>
                        @endif

                        @if(Session::get('fail'))
                        <div class="alert alert-danger">
                            {{ Session::get('fail') }}
                        </div>
                        @endif

                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" class="form-control" name="name" placeholder="Enter full name" value="{{ old('name') }}">
                            <span class="text-danger">@error('name'){{ $message }} @enderror</span>

                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="text" class="form-control" name="email" placeholder="Enter email address" value="{{ old('email') }}">
                            <span class="text-danger">@error('name'){{ $message }} @enderror</span>
                        </div>
                        <div class="form-group">
                            <label>Phone</label>
                            <input type="text" class="form-control" name="phone" placeholder="Enter phone no" value="{{ old('phpne') }}">
                            <span class="text-danger">@error('name'){{ $message }} @enderror</span>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" name="password" placeholder="Enter password">
                            <span class="text-danger">@error('name'){{ $message }} @enderror</span>
                        </div>
                        <button type="submit" class="btn btn-block btn-primary">Save</button>
                        <br>

                    </form>
                </div>
            </div>
        </div>

    </body>
</html>