<?php echo $header; ?>
<div id="content" class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="icon-exclamation-sign"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="panel panel-default">
    <div class="panel-heading">
      <div class="pull-right">
        <button type="submit" form="form-usps" class="btn btn-primary"><i class="icon-ok"></i> <?php echo $button_save; ?></button>
        <a href="<?php echo $cancel; ?>" class="btn btn-danger"><i class="icon-remove"></i> <?php echo $button_cancel; ?></a></div>
      <h1 class="panel-title"><i class="icon-edit icon-large"></i> <?php echo $heading_title; ?></h1>
    </div>
    <div class="panel-body">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-usps" class="form-horizontal">
        <div class="form-group required">
          <label class="col-sm-2 control-label" for="input-user-id"><?php echo $entry_user_id; ?></label>
          <div class="col-sm-10">
            <input type="text" name="usps_user_id" value="<?php echo $usps_user_id; ?>" placeholder="<?php echo $entry_user_id; ?>" id="input-user-id" class="form-control" />
            <?php if ($error_user_id) { ?>
            <span class="error"><?php echo $error_user_id; ?></span>
            <?php } ?>
          </div>
        </div>
        <div class="form-group required">
          <label class="col-sm-2 control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
          <div class="col-sm-10">
            <input type="text" name="usps_postcode" value="<?php echo $usps_postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
            <?php if ($error_postcode) { ?>
            <span class="error"><?php echo $error_postcode; ?></span>
            <?php } ?>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><?php echo $entry_domestic; ?></label>
          <div class="col-sm-10">
            <div class="well">
              <div class="checkbox">
                <label>
                  <?php if ($usps_domestic_00) { ?>
                  <input type="checkbox" name="usps_domestic_00" value="1" checked="checked" />
                  <?php echo $text_domestic_00; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_domestic_00" value="1" />
                  <?php echo $text_domestic_00; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_domestic_01) { ?>
                  <input type="checkbox" name="usps_domestic_01" value="1" checked="checked" />
                  <?php echo $text_domestic_01; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_domestic_01" value="1" />
                  <?php echo $text_domestic_01; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_domestic_02) { ?>
                  <input type="checkbox" name="usps_domestic_02" value="1" checked="checked" />
                  <?php echo $text_domestic_02; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_domestic_02" value="1" />
                  <?php echo $text_domestic_02; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_domestic_03) { ?>
                  <input type="checkbox" name="usps_domestic_03" value="1" checked="checked" />
                  <?php echo $text_domestic_03; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_domestic_03" value="1" />
                  <?php echo $text_domestic_03; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_domestic_1) { ?>
                  <input type="checkbox" name="usps_domestic_1" value="1" checked="checked" />
                  <?php echo $text_domestic_1; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_domestic_1" value="1" />
                  <?php echo $text_domestic_1; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_domestic_2) { ?>
                  <input type="checkbox" name="usps_domestic_2" value="1" checked="checked" />
                  <?php echo $text_domestic_2; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_domestic_2" value="1" />
                  <?php echo $text_domestic_2; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_domestic_3) { ?>
                  <input type="checkbox" name="usps_domestic_3" value="1" checked="checked" />
                  <?php echo $text_domestic_3; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_domestic_3" value="1" />
                  <?php echo $text_domestic_3; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_domestic_4) { ?>
                  <input type="checkbox" name="usps_domestic_4" value="1" checked="checked" />
                  <?php echo $text_domestic_4; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_domestic_4" value="1" />
                  <?php echo $text_domestic_4; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_domestic_5) { ?>
                  <input type="checkbox" name="usps_domestic_5" value="1" checked="checked" />
                  <?php echo $text_domestic_5; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_domestic_5" value="1" />
                  <?php echo $text_domestic_5; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_domestic_6) { ?>
                  <input type="checkbox" name="usps_domestic_6" value="1" checked="checked" />
                  <?php echo $text_domestic_6; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_domestic_6" value="1" />
                  <?php echo $text_domestic_6; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_domestic_7) { ?>
                  <input type="checkbox" name="usps_domestic_7" value="1" checked="checked" />
                  <?php echo $text_domestic_7; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_domestic_7" value="1" />
                  <?php echo $text_domestic_7; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_domestic_12) { ?>
                  <input type="checkbox" name="usps_domestic_12" value="1" checked="checked" />
                  <?php echo $text_domestic_12; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_domestic_12" value="1" />
                  <?php echo $text_domestic_12; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_domestic_13) { ?>
                  <input type="checkbox" name="usps_domestic_13" value="1" checked="checked" />
                  <?php echo $text_domestic_13; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_domestic_13" value="1" />
                  <?php echo $text_domestic_13; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_domestic_16) { ?>
                  <input type="checkbox" name="usps_domestic_16" value="1" checked="checked" />
                  <?php echo $text_domestic_16; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_domestic_16" value="1" />
                  <?php echo $text_domestic_16; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_domestic_17) { ?>
                  <input type="checkbox" name="usps_domestic_17" value="1" checked="checked" />
                  <?php echo $text_domestic_17; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_domestic_17" value="1" />
                  <?php echo $text_domestic_17; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_domestic_18) { ?>
                  <input type="checkbox" name="usps_domestic_18" value="1" checked="checked" />
                  <?php echo $text_domestic_18; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_domestic_18" value="1" />
                  <?php echo $text_domestic_18; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_domestic_19) { ?>
                  <input type="checkbox" name="usps_domestic_19" value="1" checked="checked" />
                  <?php echo $text_domestic_19; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_domestic_19" value="1" />
                  <?php echo $text_domestic_19; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_domestic_22) { ?>
                  <input type="checkbox" name="usps_domestic_22" value="1" checked="checked" />
                  <?php echo $text_domestic_22; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_domestic_22" value="1" />
                  <?php echo $text_domestic_22; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_domestic_23) { ?>
                  <input type="checkbox" name="usps_domestic_23" value="1" checked="checked" />
                  <?php echo $text_domestic_23; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_domestic_23" value="1" />
                  <?php echo $text_domestic_23; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_domestic_25) { ?>
                  <input type="checkbox" name="usps_domestic_25" value="1" checked="checked" />
                  <?php echo $text_domestic_25; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_domestic_25" value="1" />
                  <?php echo $text_domestic_25; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_domestic_27) { ?>
                  <input type="checkbox" name="usps_domestic_27" value="1" checked="checked" />
                  <?php echo $text_domestic_27; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_domestic_27" value="1" />
                  <?php echo $text_domestic_27; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_domestic_28) { ?>
                  <input type="checkbox" name="usps_domestic_28" value="1" checked="checked" />
                  <?php echo $text_domestic_28; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_domestic_28" value="1" />
                  <?php echo $text_domestic_28; ?>
                  <?php } ?>
                </label>
              </div>
            </div>
            <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a></div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><?php echo $entry_international; ?></label>
          <div class="col-sm-10">
            <div class="well">
              <div class="checkbox">
                <label>
                  <?php if ($usps_international_1) { ?>
                  <input type="checkbox" name="usps_international_1" value="1" checked="checked" />
                  <?php echo $text_international_1; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_international_1" value="1" />
                  <?php echo $text_international_1; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_international_2) { ?>
                  <input type="checkbox" name="usps_international_2" value="1" checked="checked" />
                  <?php echo $text_international_2; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_international_2" value="1" />
                  <?php echo $text_international_2; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_international_4) { ?>
                  <input type="checkbox" name="usps_international_4" value="1" checked="checked" />
                  <?php echo $text_international_4; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_international_4" value="1" />
                  <?php echo $text_international_4; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_international_5) { ?>
                  <input type="checkbox" name="usps_international_5" value="1" checked="checked" />
                  <?php echo $text_international_5; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_international_5" value="1" />
                  <?php echo $text_international_5; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_international_6) { ?>
                  <input type="checkbox" name="usps_international_6" value="1" checked="checked" />
                  <?php echo $text_international_6; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_international_6" value="1" />
                  <?php echo $text_international_6; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_international_7) { ?>
                  <input type="checkbox" name="usps_international_7" value="1" checked="checked" />
                  <?php echo $text_international_7; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_international_7" value="1" />
                  <?php echo $text_international_7; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_international_8) { ?>
                  <input type="checkbox" name="usps_international_8" value="1" checked="checked" />
                  <?php echo $text_international_8; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_international_8" value="1" />
                  <?php echo $text_international_8; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_international_9) { ?>
                  <input type="checkbox" name="usps_international_9" value="1" checked="checked" />
                  <?php echo $text_international_9; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_international_9" value="1" />
                  <?php echo $text_international_9; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_international_10) { ?>
                  <input type="checkbox" name="usps_international_10" value="1" checked="checked" />
                  <?php echo $text_international_10; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_international_10" value="1" />
                  <?php echo $text_international_10; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_international_11) { ?>
                  <input type="checkbox" name="usps_international_11" value="1" checked="checked" />
                  <?php echo $text_international_11; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_international_11" value="1" />
                  <?php echo $text_international_11; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_international_12) { ?>
                  <input type="checkbox" name="usps_international_12" value="1" checked="checked" />
                  <?php echo $text_international_12; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_international_12" value="1" />
                  <?php echo $text_international_12; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_international_13) { ?>
                  <input type="checkbox" name="usps_international_13" value="1" checked="checked" />
                  <?php echo $text_international_13; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_international_13" value="1" />
                  <?php echo $text_international_13; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_international_14) { ?>
                  <input type="checkbox" name="usps_international_14" value="1" checked="checked" />
                  <?php echo $text_international_14; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_international_14" value="1" />
                  <?php echo $text_international_14; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_international_15) { ?>
                  <input type="checkbox" name="usps_international_15" value="1" checked="checked" />
                  <?php echo $text_international_15; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_international_15" value="1" />
                  <?php echo $text_international_15; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_international_16) { ?>
                  <input type="checkbox" name="usps_international_16" value="1" checked="checked" />
                  <?php echo $text_international_16; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_international_16" value="1" />
                  <?php echo $text_international_16; ?>
                  <?php } ?>
                </label>
              </div>
              <div class="checkbox">
                <label>
                  <?php if ($usps_international_21) { ?>
                  <input type="checkbox" name="usps_international_21" value="1" checked="checked" />
                  <?php echo $text_international_21; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="usps_international_21" value="1" />
                  <?php echo $text_international_21; ?>
                  <?php } ?>
                </label>
              </div>
            </div>
            <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a></div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-size"><?php echo $entry_size; ?></label>
          <div class="col-sm-10">
            <select name="usps_size" id="input-size" class="form-control">
              <?php foreach ($sizes as $size) { ?>
              <?php if ($size['value'] == $usps_size) { ?>
              <option value="<?php echo $size['value']; ?>" selected="selected"><?php echo $size['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $size['value']; ?>"><?php echo $size['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-container"><?php echo $entry_container; ?></label>
          <div class="col-sm-10">
            <select name="usps_container" id="input-container" class="form-control">
              <?php foreach ($containers as $container) { ?>
              <?php if ($container['value'] == $usps_container) { ?>
              <option value="<?php echo $container['value']; ?>" selected="selected"><?php echo $container['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $container['value']; ?>"><?php echo $container['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-machinable"><?php echo $entry_machinable; ?></label>
          <div class="col-sm-10">
            <select name="usps_machinable" id="input-machinable" class="form-control">
              <?php if ($usps_machinable) { ?>
              <option value="1" selected="selected"><?php echo $text_yes; ?></option>
              <option value="0"><?php echo $text_no; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_yes; ?></option>
              <option value="0" selected="selected"><?php echo $text_no; ?></option>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="form-group required">
          <label class="col-sm-2 control-label" for="input-length"><?php echo $entry_dimension; ?> </label>
          <div class="col-sm-10">
            <div class="row">
              <div class="col-sm-4">
                <input type="text" name="usps_length" value="<?php echo $usps_length; ?>" placeholder="<?php echo $entry_length; ?>" id="input-length" class="form-control" />
              </div>
              <div class="col-sm-4">
                <input type="text" name="usps_width" value="<?php echo $usps_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
              </div>
              <div class="col-sm-4">
                <input type="text" name="usps_height" value="<?php echo $usps_height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
              </div>
            </div>
            <span class="help-block"><?php echo $help_dimension; ?></span>
            <?php if ($error_dimension) { ?>
            <span class="error"><?php echo $error_dimension; ?></span>
            <?php } ?>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><?php echo $entry_display_time; ?></label>
          <div class="col-sm-10">
            <label class="radio-inline">
              <?php if ($usps_display_time) { ?>
              <input type="radio" name="usps_display_time" value="1" checked="checked" />
              <?php echo $text_yes; ?>
              <?php } else { ?>
              <input type="radio" name="usps_display_time" value="1" />
              <?php echo $text_yes; ?>
              <?php } ?>
            </label>
            <label class="radio-inline">
              <?php if (!$usps_display_time) { ?>
              <input type="radio" name="usps_display_time" value="0" checked="checked" />
              <?php echo $text_no; ?>
              <?php } else { ?>
              <input type="radio" name="usps_display_time" value="0" />
              <?php echo $text_no; ?>
              <?php } ?>
            </label>
            <span class="help-block"><?php echo $help_display_time; ?></span> </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><?php echo $entry_display_weight; ?></label>
          <div class="col-sm-10">
            <label class="radio-inline">
              <?php if ($usps_display_weight) { ?>
              <input type="radio" name="usps_display_weight" value="1" checked="checked" />
              <?php echo $text_yes; ?>
              <?php } else { ?>
              <input type="radio" name="usps_display_weight" value="1" />
              <?php echo $text_yes; ?>
              <?php } ?>
            </label>
            <label class="radio-inline">
              <?php if (!$usps_display_weight) { ?>
              <input type="radio" name="usps_display_weight" value="0" checked="checked" />
              <?php echo $text_no; ?>
              <?php } else { ?>
              <input type="radio" name="usps_display_weight" value="0" />
              <?php echo $text_no; ?>
              <?php } ?>
            </label>
            <span class="help-block"><?php echo $help_display_weight; ?></span> </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-weight-class"><?php echo $entry_weight_class; ?></label>
          <div class="col-sm-10">
            <select name="usps_weight_class_id" id="input-weight-class" class="form-control">
              <?php foreach ($weight_classes as $weight_class) { ?>
              <?php if ($weight_class['weight_class_id'] == $usps_weight_class_id) { ?>
              <option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
            <span class="help-block"><?php echo $help_weight_class; ?></span> </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-tax-class"><?php echo $entry_tax; ?></label>
          <div class="col-sm-10">
            <select name="usps_tax_class_id" id="input-tax-class" class="form-control">
              <option value="0"><?php echo $text_none; ?></option>
              <?php foreach ($tax_classes as $tax_class) { ?>
              <?php if ($tax_class['tax_class_id'] == $usps_tax_class_id) { ?>
              <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-geo-zone"><?php echo $entry_geo_zone; ?></label>
          <div class="col-sm-10">
            <select name="usps_geo_zone_id" id="input-geo-zone" class="form-control">
              <option value="0"><?php echo $text_all_zones; ?></option>
              <?php foreach ($geo_zones as $geo_zone) { ?>
              <?php if ($geo_zone['geo_zone_id'] == $usps_geo_zone_id) { ?>
              <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
          <div class="col-sm-10">
            <select name="usps_status" id="input-status" class="form-control">
              <?php if ($usps_status) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
          <div class="col-sm-10">
            <input type="text" name="usps_sort_order" value="<?php echo $usps_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-debug"><?php echo $entry_debug; ?></label>
          <div class="col-sm-10">
            <select name="usps_debug" id="input-debug" class="form-control">
              <?php if ($usps_debug) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select>
            <span class="help-block"><?php echo $help_debug; ?></span> </div>
        </div>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>