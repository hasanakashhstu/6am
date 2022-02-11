
<!DOCTYPE html>
<html>
    <head>
        <title>Customer search </title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
         <div>
            <div class="container" style="margin-top: 10px;">
                <p><a href="/admin/dashboard">Dashboard</a></p>
            </div>
        </div>
        <br />
        <div class="container box">
            <h3 align="center">Customer search </h3><br />
            <div class="panel panel-default">
                <div class="panel-heading">Search Customer Data</div>
                <div class="panel-body">
                    <div class="form-group">
                        <input type="text" name="search" id="search" class="form-control" placeholder="Search Customer Data" />
                    </div>


                    <div class="table-responsive">
                        <h3 align="center">Total Data : <span id="total_records"></span></h3>


                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>Customer Name</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                </tr>
                            </thead>
                            <tbody class="all_data">

                                @foreach ($customers as $customer)
                                <tr>
                                    <th>{{ $customer['name'] }}</th>
                                    <th>{{ $customer['email'] }}</th>
                                    <th>{{ $customer['phone'] }}</th>
                                </tr>
                                @endforeach
                            </tbody>
                            <tbody class="search_data">
                                
                            </tbody>
                        </table>
                    </div>
                </div>    
            </div>
        </div>
    </body>
</html>

<script>
/*
 $(document).ready(function () {
 
 fetch_customer_data();
 
 function fetch_customer_data(query = '')
 {
 $.ajax({
 url: "{{ route('customer_search') }}",
 method: 'GET',
 data: {query: query},
 dataType: 'json',
 success: function (data)
 {
 $('tbody').html(data.table_data);
 $('#total_records').text(data.total_data);
 }
 })
 }
 
 $(document).on('keyup', '#search', function () {
 consol.log('aaaa');
 var query = $(this).val();
 fetch_customer_data(query);
 });
 });
 * 
 */
$('#search').on('keyup', function () {
   
    $value = $(this).val();
      if($value){
      $('.all_data').hide();
      $('.search_data').show();
  }
    $.ajax({
        type: 'get',
        url: "{{ URL::to('customer_search') }}",
        data: {search: $value},
      
        success: function (data)
        {
            console.log(data);
            $('tbody').html(data);
         
        }
    })
});
</script>
