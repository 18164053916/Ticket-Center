$(function(){
    $(".from-date").datepicker({
        /**区域化周为中文**/
        dayNamesMin:["日","一","二","三","四","五","六"],
        /**每周从周一开始**/
        firstDay:1,
        /**区域化月名为中文**/
        monthNames:["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"],
        /**月份显示在年后面**/
        showMonthAfterYear:true,
        /**格式化中文日期**/
        dateFormat:"yy-mm-dd",
        /**点击开始日期的时候关闭截止日期**/
        onClose:function(selectedDate){
            $( ".to-date" ).datepicker( "option", "minDate", selectedDate );
        }

    });

    $(".to-date").datepicker({
        /**区域化周为中文**/
        dayNamesMin:["日","一","二","三","四","五","六"],
        /**每周从周一开始**/
        firstDay:1,
        /**区域化月名为中文**/
        monthNames:["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"],
        /**月份显示在年后面**/
        showMonthAfterYear:true,
        /**格式化中文日期**/
        dateFormat:"yy-mm-dd",
        /**点击截止日期的时候关闭开始日期**/
        onClose:function(selectedDate){
            $( ".from-date" ).datepicker( "option", "maxDate", selectedDate );
        }
    });
})