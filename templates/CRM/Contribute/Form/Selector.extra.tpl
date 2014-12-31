
{literal}
  <script type="text/javascript">
    var storeAmount = new Array();
    cj(document).ready(function(){
      var currencySymbol = "{/literal}{$config->defaultCurrencySymbol}{literal}"; 
      cj("input[type='checkbox']").on("click",function(){
          var position  = cj(this).offset();
          var fixedLeft = position.left + 50 ;
          var fixedTop  = position.top -  cj(document).scrollTop() ;
          var dystyle   = "display:none; position: absolute; left: " + fixedLeft + "px; top: " + fixedTop + "px; position: fixed; background: #FFFFCC; border: 1px solid #CFCEC3; padding: 10px; border-radius: 5px";
          cj("#floating_total_amount").attr("style", dystyle);
          cj("#floating_total_amount").show();
        if(cj(this).attr('id') == 'toggleSelect'){
          if(cj(this).prop("checked") == true){
            var totalAmount = 0;
            var obj = cj('.form-checkbox').val('id');
            jQuery.each( obj, function( key, value ) {
              var splitId = value.id.split('_');
              if(splitId[0] == 'mark'){
                var explodetotalAmount  = cj('#rowid'+splitId[2]+' td.crm-contribution-amount span').text().split(" ");
                var amount              = parseFloat(explodetotalAmount[1]);
                totalAmount += amount;
              }
            });
            cj("#floating_total_amount").html("Total Amount:" + currencySymbol +" "+totalAmount.toFixed(2));
          }
          if(cj(this).prop("checked") == false){
            var unselectedBox       = cj(this);
            var selectedId          = cj(unselectedBox).attr('id');
            var splitId             = selectedId.split("_");
            var explodetotalAmount  = cj('#rowid'+splitId[2]+' td.crm-contribution-amount span').text().split(" ");
            var amount              = parseFloat(explodetotalAmount[1]);
            var minusResult         = cj('#floating_total_amount').text().split(" ");
            var totalminusResult    = parseFloat(minusResult[2]);
            var removeRow           = parseFloat(totalminusResult) - parseFloat(amount);
            if(isNaN(removeRow)){
              cj('#floating_total_amount').hide();
              cj("#floating_total_amount").empty();
            }else if(removeRow == 0){
              cj('#floating_total_amount').hide();
              cj("#floating_total_amount").empty();
            }else{
              cj("#floating_total_amount").html("Total Amount:" + currencySymbol +" "+removeRow.toFixed(2));
            }
          }
        }else{
          if(cj(this).prop("checked") == true){
          var selectedBox = cj(this);
          var selectedValue = cj('#floating_total_amount').text().split(" ");
          var totalSelectedValue = parseFloat(selectedValue[2]);
          if(totalSelectedValue == 0){
            var selectedId          = cj(selectedBox).attr('id');
            var splitId             = selectedId.split("_");
            var explodetotalAmount  = cj('#rowid'+splitId[2]+' td.crm-contribution-amount span').text().split(" ");
            var amount              = parseFloat(explodetotalAmount[1]);
            var totalVal = amount + totalSelectedValue;
            cj("#floating_total_amount").html("Total Amount:" + currencySymbol +" "+totalVal.toFixed(2));
          }else{
            var selectedId          = cj(selectedBox).attr('id');
            var splitId             = selectedId.split("_");
            var explodetotalAmount  = cj('#rowid'+splitId[2]+' td.crm-contribution-amount span').text().split(" ");
            var amount              = parseFloat(explodetotalAmount[1]);
            if(isNaN(totalSelectedValue)){
              cj("#floating_total_amount").html("Total Amount:" + currencySymbol +" "+amount.toFixed(2));
            }else{
              var totalAmount = amount + totalSelectedValue;
              cj("#floating_total_amount").html("Total Amount:" + currencySymbol +" "+totalAmount.toFixed(2));
            }
          }
        }
        if(cj(this).prop("checked") == false){
          var unselectedBox       = cj(this);
          var selectedId          = cj(unselectedBox).attr('id');
          var splitId             = selectedId.split("_");
          var explodetotalAmount  = cj('#rowid'+splitId[2]+' td.crm-contribution-amount span').text().split(" ");
          var amount              = parseFloat(explodetotalAmount[1]);
          var minusResult         = cj('#floating_total_amount').text().split(" ");
          var totalminusResult    = parseFloat(minusResult[2]);
          var removeRow           = parseFloat(totalminusResult) - parseFloat(amount);
          if(isNaN(removeRow)){
            cj('#floating_total_amount').hide();
            cj("#floating_total_amount").empty();
          }else if(removeRow == 0){
            cj('#floating_total_amount').hide();
            cj("#floating_total_amount").empty();
          }else{
            cj("#floating_total_amount").html("Total Amount:" + currencySymbol +" "+removeRow.toFixed(2));
          }
        }
      }
    });
    cj('td.nowrap').click(function(){
      cj('#floating_total_amount').hide();
      cj("#floating_total_amount").empty();
    });
  });
  </script>
{/literal}