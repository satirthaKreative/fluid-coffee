<?php include_once "../include/header.php"; ?>
<?php include_once "../include/sidebar.php"; ?>
<?php include_once "../include/query.php"; ?>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>Language</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active">Table View</li>
          </ol>
        </div>
      </div>
    </div><!-- /.container-fluid -->
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="container-fluid">
      <!-- /.row -->
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="row">
              <div class="col-sm-3 col-xs-12">
                <button type="button" class="btn btn-success mr20" onclick="add_campaign()">Add Campaign Language</button>
              </div>
            </div>
            <div class="card-header">
              <h3 class="card-title">Campaign Language Table</h3>

              <div class="card-tools">
                <div class="input-group input-group-sm" style="width: 150px;">
                  <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                  <div class="input-group-append">
                    <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
                  </div>
                </div>
              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body table-responsive p-0">
              <table class="table table-hover table-striped">
                <thead class="bg-color color-white">
                  <tr>
                    <th>ID</th>
                    <th>Language Name</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                <?php 
                $i = 1;
                if($selectLanguage->num_rows > 0){
                while($fetchCate = $selectLanguage->fetch_array()){ 
                ?>
                  <tr>
                    <td><?= $i; ?></td>
                    <td><?= $fetchCate['cate_name'] ?></td>
                    <td><?= date('d M,Y',strtotime($fetchCate['added_on'])); ?></td>
                    <td>
                      <div class="switch">
                        <label>
                          Active
                          <input type="checkbox" id="check_active_status" onchange="my_language_status(<?= $fetchCate['id'] ?>)" <?php if($fetchCate['status']==1){ ?>checked="checked" <?php }else{ ?>  <?php } ?>  value="<?php if($fetchCate['status']==1){ ?>1<?php }else{ ?>0<?php } ?>">
                          <span class="lever"></span> Inactive
                        </label>
                      </div>
                    </td>
                    <td><button type="button" class="btn btn-success btn-sm border-rad30" onclick="edit_catgory(<?= $fetchCate['id'] ?>)"><i class="fa fa-edit"></i></button> <button type="button" class="btn btn-danger btn-sm border-rad30" onclick="del_catgory(<?= $fetchCate['id'] ?>)"><i class="fa fa-trash"></i></button></td>
                  </tr>
                <?php 
                  $i++; } 
                }else{
                ?>
                <tr>
                  <td colspan="5"><center class="text-warning text-bold">No Data Listed Yet </center></td>
                </tr>
                <?php } ?>
                </tbody>
              </table>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
      </div>
      <!-- /.row -->
    </div><!-- /.container-fluid -->
  </section>
  <!-- /.content -->
</div>

<!-- Adding Modal -->
<div class="modal" id="add_modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Language</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="exampleInputEmail1">Language Name</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter campaign category">
            <small id="emailHelp" class="form-text color-red">Campaign Language Add.</small>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <p class="text-success"></p>
        <button type="button" class="btn btn-primary" id="save_data" onclick="save_data();">Save</button>
        <button type="button" class="btn btn-danger" id="close_data" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- /.content-wrapper -->
<?php include_once "../include/footer.php"; ?>
<script>
  function add_campaign()
  {
    $("#save_data").attr('onclick','save_data()');
    $(".modal-title").html("Add Language");
    $(".modal-body").html('<form><div class="form-group"><label for="exampleInputEmail1">Language Name</label><input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Languages"><small id="emailHelp" class="form-text color-red">Language Add.</small></div></form>');
    $("#add_modal").modal('show');
  }

  function save_data()
  {
    var data1 = $("#exampleInputEmail1").val();
    var action_type = 'add';
    $.ajax({
      url: 'ajax-page/language.php',
      type: 'post',
      data: {data1:data1,action_type:action_type},
      dataType: 'json',
      success:  function(event)
      {
        console.log(event);
        if(event.no_error == true)
        {
          $(".text-success").html("<i class='fa fa-check'>"+event.main_msg+"</i>").fadeIn().delay(3000).fadeOut('slow');
          setTimeout(function(){ $("#add_modal").modal('hide');window.location.href='<?= $lastPart; ?>'; }, 3000);
        }
      }
    })
  }
  // update campaign category
  function edit_catgory(data)
  {
    $("#save_data").attr('onclick','update_category('+data+')');
    $(".modal-title").html("Edit Category");
    
    edit_data(data);
    $("#add_modal").modal('show');
  }
  $(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
  });
  // view data
  function edit_data(data)
  {
    $.ajax({
      url: 'ajax-page/view_language.php',
      type: 'post',
      data: {data_val: data},
      dataType: 'json',
      success:  function(event)
      {
        console.log(event);
        $("#exampleInputEmail1").val(event.cate_name);
        $(".modal-body").html('<form><div class="form-group"><label for="exampleInputEmail1">Language Name</label><input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="'+event.cate_name+'" placeholder="Enter campaign language"><small id="emailHelp" class="form-text color-red">Campaign language Add.</small></div></form>');
      }
    })
  }
  // update category
  function update_category(data)
  {
    var data1 = $("#exampleInputEmail1").val();
    var action_type = 'update';
    $.ajax({
      url: 'ajax-page/language.php',
      type: 'post',
      data: {data1:data1,action_type:action_type,data_new: data},
      dataType: 'json',
      success:  function(event)
      {
        console.log(event);
        if(event.no_error == true)
        {
          $(".text-success").html("<i class='fa fa-check'>"+event.main_msg+"</i>").fadeIn().delay(3000).fadeOut('slow');
          setTimeout(function(){ window.location.href='<?= $lastPart; ?>'; }, 3000);
        }
      }
    })
  }
  // delete category
  function del_catgory(data)
  {
     $("#save_data").attr('onclick','delete_category('+data+')');
     $(".modal-title").html("Delete Category");
     $(".modal-body").html("<p>Are You really want to delete this language ?</p>");
     $("#add_modal").modal('show');
     $("#save_data").attr('value','Delete');
     $("#close_data").attr('value','Cancel');
  }
  // delete category
  function delete_category(data)
  {
    var data1 = data;
    var action_type = 'delete';
    $.ajax({
      url: 'ajax-page/language.php',
      type: 'post',
      data: {data1:data1,action_type:action_type},
      dataType: 'json',
      success:  function(event)
      {
        console.log(event);
        if(event.no_error == true)
        {
          $(".text-success").html("<i class='fa fa-check'>"+event.main_msg+"</i>").fadeIn().delay(3000).fadeOut('slow');
          setTimeout(function(){ window.location.href='<?= $lastPart; ?>'; }, 3000);
        }
      }
    })
  }
  // change category
  function change_status(data, status_id)
  {
    var action_type = 'status';
    $.ajax({
      url: 'ajax-page/language.php',
      type: 'post',
      data: {status_id: status_id, action_type:action_type, data:data},
      dataType: 'json',
      success:  function(event)
      {
        console.log(event);
        if(event.no_error == true)
        {
          $(".modal-body").html("<p class='color-green'><center ><i class='fa fa-check  suc-modal-pop'></i><br/>Successfully Updated</center></p>");
          $(".modal-header").hide();
          $(".modal-footer").hide();
          $("#add_modal").modal('show');
          setTimeout(function(){ window.location.href='<?= $lastPart; ?>'; }, 3000);
        }
      }
    })
  }
  // data value
  function my_language_status(state_id)
  {
    var lang = $("#check_active_status").val();
    if(lang == 1)
    {
       lang = $("#check_active_status").val(0);
    }
    else if(lang == 0)
    {
       lang = $("#check_active_status").val(1);
    }
    lang = $("#check_active_status").val();
    var action_type = 'language_status';
    $.ajax({
      url: 'ajax-page/language.php',
      type: 'post',
      data: {action_type:action_type, data:lang, state_id:state_id},
      dataType: 'json',
      success:  function(event)
      {
        console.log(event);
        if(event.no_error == true)
        {
          // setTimeout(function(){ window.location.href='<?= $lastPart; ?>'; }, 3000);
        }
      }
    })
  }
</script>