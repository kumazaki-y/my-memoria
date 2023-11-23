import $ from 'jquery';

$(function() {
  const fileInput = $('.article-new-file-input');
  const previewArea = $('.article-new-preview');

  fileInput.on('change', function() {
      const files = this.files;
      previewArea.empty();

      $.each(files, function(index, file) {
          const img = $('<img>').addClass('preview-image');
          img[0].file = file;
          previewArea.append(img);

          const reader = new FileReader();
          reader.onload = function(e) {
              img.attr('src', e.target.result);
          };
          reader.readAsDataURL(file);
      });
  });
});


$(function() {
  var images = []; // 画像のURLを格納する配列
  var currentIndex = 0;
  $(".article-image").on("click", function() {
    // 記事のすべての画像要素を取得
    var imageElements = $(this).closest('.article-image-container').find('.article-image');

    // それぞれの画像要素からURLを取得して配列に格納
    images = imageElements.map(function() {
        return $(this).data('target');
    }).get();

    currentIndex = imageElements.index(this); // クリックされた画像のインデックスを取得
    updateModalImage();
    $(".modal").show();
  });


  function updateModalImage() {
    if (images.length > 0 && currentIndex >= 0 && currentIndex < images.length) {
      $(".modal-image").attr("src", images[currentIndex]);
    }
  }

  $(".left-arrow").on("click", function() {
    if (currentIndex > 0) {
      currentIndex--;
      updateModalImage();
    }
  });

  $(".right-arrow").on("click", function() {
    if (currentIndex < images.length - 1) {
      currentIndex++;
      updateModalImage();
    }
  });

  $(".close").on("click", function() {
    $(".modal").hide();
  });

  $(window).on("click", function(e) {
    if ($(e.target).hasClass("modal")) {
      $(".modal").hide();
    }
  });
});
