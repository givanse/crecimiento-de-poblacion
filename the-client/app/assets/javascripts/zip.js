
function initZipButton() {
  var button = document.querySelector('#search-zip');
  button.addEventListener('click', function() {
    var input = document.querySelector('#input-zip');
    var url = window.location.origin + '/zip/' + input.value;
    window.location.href = url; 
  });
}
