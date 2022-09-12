// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"
import jQuery from "jquery";
import * as bootstrap from "bootstrap"

window.bootstrap = bootstrap
window.$ = window.jQuery = jQuery;

$(".attachment-btn").click(function() {
  let labelId = $(this).attr("for") ;
  $(`#${labelId}`).change(function() {
    let filename = $(this)[0].files;
    $(".filename").html(filename[0].name);
  })
})

$(".comment-document").click(function() {
  let labelId = $(this).attr("for") ;
  let id = $(this).data("id");
  $(`#${labelId}`).change(function() {
    let filename = $(this)[0].files;
    $(`.filename-document-${id}`).html(filename[0].name);
  })
})


