const i1=document.getElementById("i1");
function kw(obj){
  console.log(i1.value);
  obj.href=`product.html?kws=${i1.value}`
}

$(function(){
  $("#head").load("head.html")
  $(".floor").load("footer.html")
})