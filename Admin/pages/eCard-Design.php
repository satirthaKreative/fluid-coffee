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
          <h1>Campaign eCard</h1>
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
            <div class="card-header">
              <h3 class="card-title">Campaign eCard Add</h3> <button type="" class="btn btn-success float-right" onclick="add_campaign()">Add Language</button>
            </div>
            <!-- /.card-header -->
            <div class="card-body nav-test">
              <div class="nav flex-column nav-pills bg-light-gray border-rad5" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                <!-- <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Lanuages</a> -->
                <?php $count1=1; while($lan_select = $selectLanguage->fetch_array()){ ?>
                  <a class="nav-link <?php if($count1==1){ ?> active <?php } ?>" id="v-pills-<?= $lan_select['cate_name']; ?>-tab" data-toggle="pill" href="#v-pills-<?= $lan_select['cate_name']; ?>" role="tab" aria-controls="v-pills-<?= $lan_select['cate_name']; ?>" aria-selected="false"><?= $lan_select['cate_name']; ?></a>
                <?php $count1++;} ?>
              </div>
              <div class="tab-content" id="v-pills-tabContent">
                <form id="eCard_des">
                <!-- <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab"></div> -->
                <?php
                $count = 1;
                $selectLanguage1 = $my_db->query("SELECT * FROM ".$db_prefix."languages");
                while($lan_select1 = $selectLanguage1->fetch_array()){ ?>
                <div class="tab-pane fade <?php if($count==1){ ?> show active <?php } ?>" id="v-pills-<?= $lan_select1['cate_name']; ?>" role="tabpanel" aria-labelledby="v-pills-<?= $lan_select1['cate_name']; ?>-tab">
                  <div class="col-sm-8">
                    <!-- <form id="eCard_des"> -->
                      <div class="form-group">
                        <label for="title">Category:</label>
                        <select type="text" class="form-control" id="title" name="cate[]">
                          <?php 
                            $selectCate1 = $my_db->query("SELECT * FROM ".$db_prefix."category ");
                            while($cate_select = $selectCate1->fetch_array()){ ?>
                            <option value="<?= $cate_select['id'] ?>"><?= $cate_select['cate_name'] ?></option>
                          <?php } ?>
                        </select>
                      </div>

                      <div class="form-group">
                        <label for="title">Title:</label>
                        <input type="text" class="form-control" id="title" name="title[]">
                        <input type="hidden" name="t_id[]" value="<?= $lan_select1['id']; ?>">
                      </div>
                      <div class="form-group">
                        <label for="short_d">Short Description:</label>
                        <textarea class="form-control" id="short_d" name="short_d[]"></textarea>
                      </div>
                    <!-- </form> -->
                  </div>
                  <div class="col-sm-4"></div>
                </div>
                <?php $count++; } ?>
              </form>
                <div class="row">
                <div class="col-12">
                  <button class="btn btn-primary border-rad30" type="button" onclick="submit_lang()">Submit</button>
                  <span class="succ_msg"></span>
                </div>
              </div>
              </div>
              
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
<?php include_once "../include/footer.php"; ?>
<script>
  function add_campaign()
  {
    $("#save_data").attr('onclick','save_data()');
    $(".modal-title").html("Add Language");
    $(".modal-body").html('<form><div class="form-group"><label for="exampleInputEmail1">Language Name</label><input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Languages"><small id="emailHelp" class="form-text color-red">Language Add.</small></div></form>');
    $("#add_modal").modal('show');
  }

  function submit_lang()
  {
    // alert('data');
    $.ajax({
      url: 'ajax-page/eCard-lang.php',
      type: 'post',
      data: $("#eCard_des").serialize(),
      dataType: 'json',
      success: function(event)
      {
        console.log(event);
        if(event.no_error == true)
        {
          $(".succ_msg").html("<b class='text-success'>"+event.main_error+"</b>").fadeIn().delay(3000).fadeOut('slow');
        }
        else
        {
          $(".succ_msg").html("<b class='text-danger'>"+event.main_error+"</b>").fadeIn().delay(3000).fadeOut('slow');
        }
      }
    })
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
</script>