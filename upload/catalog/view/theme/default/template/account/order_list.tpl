<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <div id="content" class="col-sm-9"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <?php if ($orders) { ?>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-right"><?php echo $column_order_id; ?></td>
            <td class="text-left"><?php echo $column_status; ?></td>
            <td class="text-left"><?php echo $column_date_added; ?></td>
            <td class="text-right"><?php echo $column_product; ?></td>
            <td class="text-left"><?php echo $column_customer; ?></td>
            <td class="text-right"><?php echo $column_total; ?></td>
            <td></td>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($orders as $order) { ?>
          <tr>
            <td class="text-right">#<?php echo $order['order_id']; ?></td>
            <td class="text-left"><?php echo $order['status']; ?></td>
            <td class="text-left"><?php echo $order['date_added']; ?></td>
            <td class="text-right"><?php echo $order['products']; ?></td>
            <td class="text-left"><?php echo $order['name']; ?></td>
            <td class="text-right"><?php echo $order['total']; ?></td>
            <td><a href="<?php echo $order['href']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>"><i class="icon-eye-open"></i></a> <a href="<?php echo $order['reorder']; ?>" data-toggle="tooltip" title="<?php echo $button_reorder; ?>"><i class="icon-refresh"></i></a></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      <div class="pagination"><?php echo $pagination; ?></div>
      <?php } else { ?>
      <div class="enpty"><?php echo $text_empty; ?></div>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>