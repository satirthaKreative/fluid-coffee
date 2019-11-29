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

<!-- /.content-wrapper -->
<?php include_once "../include/footer.php"; ?>
<script>
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
</script>