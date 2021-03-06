<?php include_once "../include/header.php"; ?>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>e-Card Template</h1>
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
                <button type="button" class="btn btn-success mr20" onclick="add_campaign()">Add e-Card Template</button>
              </div>
            </div>
            <div class="card-header">
              <h3 class="card-title">e-Card Template Table</h3>

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
                    <th>e-Card Template</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Action</th>
                    <th>Copy Action</th>
                  </tr>
                </thead>
                <tbody>
                <?php 
                $i = 1;
                if($selectImage->num_rows > 0){
                while($fetchCate = $selectImage->fetch_array()){ 
                ?>
                  <tr>
                    <td><?= $i; ?></td>
                    <td><img src="uploads/<?= $fetchCate['ecard_path'] ?>/<?= $fetchCate['ecard_img'] ?>" alt="" height="100" width="150"></td>
                    <td><?= date('d M,Y',strtotime($fetchCate['update_on'])); ?></td>
                    <td>
                      <div class="switch">
                        <label>
                          Active
                          <input type="checkbox" id="check_active_status" onchange="my_language_status(<?= $fetchCate[0] ?>)" <?php if($fetchCate[6]==1){ ?>checked="checked" <?php }else{ ?>  <?php } ?>  value="<?php if($fetchCate[6]==1){ ?>1<?php }else{ ?>0<?php } ?>">
                          <span class="lever"></span> Inactive
                        </label>
                      </div>
                    </td>
                    <td><!-- <button type="button" class="btn btn-success btn-sm border-rad30" onclick="edit_catgory(<?= $fetchCate['id'] ?>)"><i class="fa fa-edit"></i></button> --> <button type="button" class="btn btn-danger btn-sm border-rad30" onclick="del_catgory(<?= $fetchCate[0] ?>)"><i class="fa fa-trash"></i></button></td>
                    <td><button type="button" class="btn btn-success btn-sm" onclick='copy_eCard(<?= $fetchCate['campaign_category'].",".$fetchCate[0] ?>)'>Copy eCrad</button></td>
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
        <form id="form-template" enctype="multipart/form-data">
          <div class="form-group">
            <label for="choose_campaign">Choose Campaign</label>
            <select type="text" name="choose_campaign" class="form-control" id="choose_campaign" aria-describedby="emailHelp">
              <option value="">Choose Campaign Type</option>
                <?php while($fetch_category = $selectCate->fetch_array()){ ?>
                  <option value="<?= $fetch_category['id'] ?>"><?= $fetch_category['cate_name'] ?></option>
                <?php } ?>
            </select>
          </div>
          <div class="form-group">
            <label for="exampleInputEmail2">Upload Image</label>
            <div class="upload-image">
              <div class="adding-section">
                <span class="design-add-on"><a href="javascript:;" onclick="add_more(1)"><i class="fa fa-plus plus-design mr5"></i></a> <!-- <a href="javascript:;" onclick="delete_more()"><i class="fa fa-minus minus-design"></i></a> --></span>
                <input type="file" name="upload_img[]" class="form-control" id="exampleInputEmail2" aria-describedby="emailHelp">
              </div>
            </div>
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

<!-- copy to eCrad modal -->
<div class="modal" id="eCrad-modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Copy eCard Template</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="form-copy-template">
          <div class="form-group">
            <label for="choose_copy_campaign">Choose Campaign to Copy</label>
            <select type="text" name="choose_copy_campaign" class="form-control" id="choose_copy_campaign" aria-describedby="emailHelp">
              <option value="">Choose Campaign Type</option>
                <?php
                $selectCopyCate = $my_db->query("SELECT * FROM ".$db_prefix."category WHERE id <> '".$_SESSION['category_id']."' "); 
                while($fetch_copy_category = $selectCopyCate->fetch_array()){ ?>
                  <option value="<?= $fetch_copy_category['id'] ?>"><?= $fetch_copy_category['cate_name'] ?></option>
                <?php } ?>
            </select>
            <?php $select_card_image = $my_db->query("SELECT * FROM ".$db_prefix."image WHERE id = '".$_SESSION['image_session_id']."' "); $fetch_card_image = $select_card_image->fetch_array(); ?>
            <input type="hidden" name="card_image" id="card_image" value="<?= $fetch_card_image['ecard_img']; ?>">
            <input type="hidden" name="card_path" id="card_path" value="<?= $fetch_card_image['ecard_path']; ?>">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <p class="text-success"></p>
        <button type="button" class="btn btn-primary" id="save_data" onclick="copy_data();">Copy</button>
        <button type="button" class="btn btn-danger" id="close_data" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- /.content-wrapper -->
<?php include_once "../include/footer.php"; ?>
<script>
  // adding campaign
  function copy_eCard(data,image_id)
  {
    var hidden_data = data; 
    var image_new_id = image_id;
    $.ajax({
      url: 'ajax-page/session-hidden-ajax.php',
      type: 'post',
      data:  {hidden_data: hidden_data, image_new_id:  image_new_id},
      dataType: 'json',
      success: function(event)
      {
        console.log(event);
        $("#eCrad-modal").modal('show');
      }
    })
  }
  //copty data
  function copy_data()
  {
    $.ajax({
      url: 'ajax-page/copy-eCard.php',
      type: 'post',
      data: $('#form-copy-template').serialize(),
      dataType: 'text',
      success:  function(event)
      {

          $(".text-success").html("<i class='fa fa-check'>Successfully Copied</i>").fadeIn().delay(3000).fadeOut('slow');
          setTimeout(function(){ $("#eCrad-modal").modal('hide');window.location.href='<?= $lastPart; ?>'; }, 3000);
      }
    })
  }
  // show modal
  function add_campaign()
  {
    $("#save_data").attr('onclick','save_data()');
    $(".modal-title").html("Add eCard Template");
    // $(".modal-body").html('<form><div class="form-group"><label for="exampleInputEmail1">Language Name</label><input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Languages"><small id="emailHelp" class="form-text color-red">Language Add.</small></div></form>');
    $("#add_modal").modal('show');
  }

  function add_more(i)
  {
    var i = i+1;
    $(".upload-image").append('<div class="adding-section'+i+' mt20"><span class="design-add-on"><a href="javascript:;" onclick="add_more('+i+')"><i class="fa fa-plus plus-design mr5"></i></a> <a href="javascript:;" onclick="delete_more('+i+')"><i class="fa fa-minus minus-design"></i></a></span><input name="upload_img[]" type="file" class="form-control" id="exampleInputEmail2" aria-describedby="emailHelp"></div>');
    i++;
  }

  function delete_more(i)
  {
    $(".adding-section"+i).remove();
  }

  function save_data()
  {
      // $.post( "", $("#form-template").serialize())
      //   .done(function( data ) {
      //     console.log(data);
      // });

        var form = new FormData(document.getElementById('form-template'));
        $.ajax({
          url: 'ajax-page/eCard-template.php',
          type: 'post',
          data: form,
          dataType: 'json',
          cache: false,
          contentType: false, //must, tell jQuery not to process the data
          processData: false,
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
      url: 'ajax-page/status-check.php',
      type: 'post',
      data: {action_type:action_type, data:lang, state_id:state_id},
      dataType: 'json',
      success:  function(event)
      {
        console.log(event);
        if(event.no_error == true)
        {
          setTimeout(function(){ window.location.href='<?= $lastPart; ?>'; }, 3000);
        }
      }
    })
  }
  // delete category
  function del_catgory(data)
  {
     $("#save_data").attr('onclick','delete_category('+data+')');
     $(".modal-title").html("Delete Template");
     $(".modal-body").html("<p>Are You really want to delete this Template ?</p>");
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
      url: 'ajax-page/image-status.php',
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
  
</script>