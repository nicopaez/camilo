$(document).ready(function(){
    $('#happyButton').click(function(){ rate(1) });
    $('#silentButton').click(function(){ rate(0) });
    $('#sadButton').click(function(){ rate(-1) });
});

function rate(rating) {
    $('#value').val(rating);
    $('#ratingForm').submit();
}