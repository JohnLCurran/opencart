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
      <h1>{{ heading_title }}</h1>
      <form action="{{ action }}" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <legend>{{ text_password }}</legend>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-password">{{ entry_password }}</label>
            <div class="col-sm-10">
              <input type="password" name="password" value="{{ password }}" id="input-password" class="form-control" />
              {% if error_password) { ?>
              <div class="text-danger">{{ error_password }}</div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-confirm">{{ entry_confirm }}</label>
            <div class="col-sm-10">
              <input type="password" name="confirm" value="{{ confirm }}" id="input-confirm" class="form-control" />
              {% if error_confirm) { ?>
              <div class="text-danger">{{ error_confirm }}</div>
              <?php } ?>
            </div>
          </div>
        </fieldset>
        <div class="buttons clearfix">
          <div class="pull-left"><a href="{{ back }}" class="btn btn-default">{{ button_back }}</a></div>
          <div class="pull-right"><button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> {{ button_continue }}</button></div>
        </div>
      </form>
      {{ content_bottom }}</div>
    {{ column_right }}</div>
</div>
{{ footer }}