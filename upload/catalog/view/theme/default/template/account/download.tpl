{{ header }}
<div class="container">
  <ul class="breadcrumb">
    {% for breadcrumb in breadcrumbs %}
    <li><a href="{{ breadcrumb.href }}">{{ breadcrumb.text }}</a></li>
    {% endfor %}
  </ul>
  <div class="row">{{ column_left }}
    {% if column_left and column_right %}
    <?php $class = 'col-sm-6'; ?>
    {% elseif column_left || column_right %}
    <?php $class = 'col-sm-9'; ?>
    {% else %}
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="{{ class }}">{{ content_top }}
      <h2>{{ heading_title }}</h2>
      {% if downloads) { ?>
      <div class="table-responsive">
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-right">{{ column_order_id; }}</td>
            <td class="text-left">{{ column_name; }}</td>
            <td class="text-left">{{ column_size; }}</td>
            <td class="text-left">{{ column_date_added; }}</td>
            <td></td>
          </tr>
        </thead>
        <tbody>
         {% for download in downloads %}
          <tr>
            <td class="text-right">{{ download.order_id }}</td>
            <td class="text-left">{{ download.name }}</td>
            <td class="text-left">{{ download.size }}</td>
            <td class="text-left">{{ download.date_added }}</td>
            <td><a href="{{ download.href }}" data-toggle="tooltip" title="{{ button_download }}" class="btn btn-primary"><i class="fa fa-cloud-download"></i></a></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left">{{ pagination }}</div>
        <div class="col-sm-6 text-right">{{ results }}</div>
      </div>
      {% else %}
      <p>{{ text_empty }}</p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="{{ continue }}" class="btn btn-primary">{{ button_continue }}</a></div>
      </div>
      {{ content_bottom }}</div>
    {{ column_right }}</div>
</div>
{{ footer }}