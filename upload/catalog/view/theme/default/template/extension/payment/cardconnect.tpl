<form id="cardconnect-form" action="{{ action }}" method="post" class="form form-horizontal">
  <fieldset id="payment">
    <legend>{{ text_card_details }}</legend>
	{% if echeck) { ?>
    <div class="form-group">
      <label class="col-sm-2 control-label" for="input-method">{{ entry_method }}</label>
      <div class="col-sm-10">
        <select name="method" id="input-method" class="form-control">
          <option value="card">{{ text_card }}</option>
          <option value="echeck">{{ text_echeck }}</option>
        </select>
      </div>
    </div>
	<?php } ?>
    <div class="card_container">
      <div class="form-group" {% if !$store_cards) { echo 'style="display:none"'; } ?>>
        <label class="col-sm-2 control-label">{{ entry_card_new_or_old }}</label>
          <div class="col-sm-10">
            <label class="radio-inline">
              <input type="radio" name="card_new" value="1" checked="checked"/>
              {{ entry_card_new }}
            </label>
            <label class="radio-inline">
              <input type="radio" name="card_new" value="0"/>
              {{ entry_card_old }}
            </label>
          </div>
      </div>
      <div class="card_new_container">
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-card-type">{{ entry_card_type }}</label>
          <div class="col-sm-10">
            <select name="card_type" id="input-card-type" class="form-control">
             {% for card_type in card_types %}
              <option value="{{ card_type.value }}">{{ card_type.text }}</option>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="form-group required">
          <label class="col-sm-2 control-label" for="input-card-number">{{ entry_card_number }}</label>
          <div class="col-sm-10">
            <input type="text" name="card_number" value="" placeholder="{{ entry_card_number }}" id="input-card-number" class="form-control" />
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-card-expiry">{{ entry_card_expiry }}</label>
          <div class="col-sm-3">
            <select name="card_expiry_month" id="input-card-expiry" class="form-control">
             {% for month in months %}
              <option value="{{ month.value }}">{{ month.text }}</option>
              <?php } ?>
            </select>
          </div>
          <div class="col-sm-3">
            <select name="card_expiry_year" class="form-control">
             {% for year in years %}
              <option value="{{ year.value }}">{{ year.text }}</option>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="form-group required">
          <label class="col-sm-2 control-label" for="input-card-cvv2">{{ entry_card_cvv2 }}</label>
          <div class="col-sm-10">
            <input type="text" name="card_cvv2" value="" placeholder="{{ entry_card_cvv2 }}" id="input-card-cvv2" class="form-control" />
          </div>
        </div>
		{% if store_cards) { ?>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-card-save" style="padding-top:0">{{ entry_card_save }}</label>
            <div class="col-sm-10">
              <input type="checkbox" name="card_save" value="1" id="input-card-save"/>
            </div>
          </div>
		<?php } ?>
      </div>
	  <div class="card_old_container" style="display:none">
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-card-choice">{{ entry_card_choice }}</label>
          <div class="col-sm-8">
            <select name="card_choice" id="input-card-choice" class="form-control" {% if !$cards) { echo 'disabled'; } ?>>
          	  {% if cards) { ?>
       		    <option value="">{{ text_select_card }}</option>
               {% for card in cards %}
                <option value="{{ card.token }}"><?php echo $card['type'] . ', &nbsp; ' . $card['account'] . ', &nbsp; ' . $card['expiry']; ?></option>
                <?php } ?>
              {% else %}
                <option value="">{{ text_no_cards }}</option>
              <?php } ?>
            </select>
          </div>
          <div class="col-sm-2">
            <input type="button" value="{{ button_delete }}" id="button-delete" data-loading-text="{{ text_loading }}" class="btn btn-danger" />
          </div>
        </div>
	  </div>
	</div>
    <div class="echeck_container" style="display:none">
      <div class="form-group required">
        <label class="col-sm-2 control-label" for="input-account-number">{{ entry_account_number }}</label>
        <div class="col-sm-10">
          <input type="text" name="account_number" value="" placeholder="{{ entry_account_number }}" id="input-account-number" class="form-control" />
        </div>
      </div>
      <div class="form-group required">
        <label class="col-sm-2 control-label" for="input-routing-number">{{ entry_routing_number }}</label>
        <div class="col-sm-10">
          <input type="text" name="routing_number" value="" placeholder="{{ entry_routing_number }}" id="input-routing-number" class="form-control" />
        </div>
      </div>
    </div>
  </fieldset>
</form>

<div class="buttons">
  <div class="pull-right">
    <input type="button" value="{{ button_confirm }}" id="button-confirm" class="btn btn-primary" data-loading-text="{{ text_loading }}">
  </div>
</div>

<script type="text/javascript"><!--
$('select[name="method"]').on('change', function() {
	if ($(this).val() == 'card') {
		$('#payment legend').text('{{ text_card_details }}');
		$('.card_container').show();
		$('.echeck_container').hide();
	} else {
		$('#payment legend').text('{{ text_echeck_details }}');
		$('.card_container').hide();
		$('.echeck_container').show();
	}
});
//--></script>

<script type="text/javascript"><!--
$('input[name="card_new"]').on('change', function() {
	if ($(this).val() == '1') {
		$('.card_new_container').show();
		$('.card_old_container').hide();
	} else {
		$('.card_new_container').hide();
		$('.card_old_container').show();
	}
});
//--></script>

<script type="text/javascript"><!--
$('#button-delete').bind('click', function() {
	if (confirm('{{ text_confirm_delete }}')) {
		$.ajax({
			url: 'index.php?route=extension/payment/cardconnect/delete',
			type: 'post',
			data: $('#input-card-choice'),
			dataType: 'json',
			beforeSend: function() {
				$('.cardconnect_message').remove();
				$('#payment').before('<div class="alert alert-info cardconnect_wait"><i class="fa fa-info-circle"></i> {{ text_wait }}</div>');
				$('#button-delete').button('loading');
			},
			complete: function() {
				$('.cardconnect_wait').remove();
				$('#button-delete').button('reset');
			},
			success: function(json) {
				if (json['error']) {
					$('#cardconnect-form').before('<div class="alert alert-danger cardconnect_message" style="display:none"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					$('.cardconnect_message').fadeIn();
				} else {
					$.ajax({
						url: 'index.php?route=checkout/confirm',
						dataType: 'html',
						success: function (html) {
							$('#collapse-checkout-confirm .panel-body').html(html);
						},
						error: function (xhr, ajaxOptions, thrownError) {
							alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
						}
					});
				}
			}
		});
	}
});
//--></script>

<script type="text/javascript"><!--
$('#button-confirm').bind('click', function() {
	$.ajax({
		url: 'index.php?route=extension/payment/cardconnect/send',
		type: 'post',
		data: $('#cardconnect-form').serialize(),
		dataType: 'json',
		beforeSend: function() {
			$('.cardconnect_message').remove();
			$('.text-danger').remove();
			$('#payment').find('*').removeClass('has-error');
			$('#payment').before('<div class="alert alert-info cardconnect_wait"><i class="fa fa-info-circle"></i> {{ text_wait }}</div>');
			$('#button-confirm').button('loading');
		},
		complete: function() {
			$('.cardconnect_wait').remove();
			$('#button-confirm').button('reset');
		},
		success: function(json) {
			if (json['error']['warning']) {
				$('#cardconnect-form').before('<div class="alert alert-danger cardconnect_message" style="display:none"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('.cardconnect_message').fadeIn();
			}

			if (json['error']['card_number']) {
				$('#input-card-number').after('<div class="text-danger">' + json['error']['card_number'] + '</div>');

				$('#input-card-number').closest('.form-group').addClass('has-error');
			}

			if (json['error']['card_cvv2']) {
				$('#input-card-cvv2').after('<div class="text-danger">' + json['error']['card_cvv2'] + '</div>');

				$('#input-card-cvv2').closest('.form-group').addClass('has-error');
			}

			if (json['error']['card_choice']) {
				$('#input-card-choice').after('<div class="text-danger">' + json['error']['card_choice'] + '</div>');

				$('#input-card-choice').closest('.form-group').addClass('has-error');
			}

			if (json['error']['method']) {
				$('#input-method').after('<div class="text-danger">' + json['error']['method'] + '</div>');

				$('#input-method').closest('.form-group').addClass('has-error');
			}

			if (json['error']['account_number']) {
				$('#input-account-number').after('<div class="text-danger">' + json['error']['account_number'] + '</div>');

				$('#input-account-number').closest('.form-group').addClass('has-error');
			}

			if (json['error']['routing_number']) {
				$('#input-routing-number').after('<div class="text-danger">' + json['error']['routing_number'] + '</div>');

				$('#input-routing-number').closest('.form-group').addClass('has-error');
			}

			if (json['success']) {
				location = json['success'];
			}
		}
	});
});
//--></script>