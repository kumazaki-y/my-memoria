import $ from 'jquery';

document.addEventListener('DOMContentLoaded', function() {
    // 特定のページでのみ実行するための条件
    if (!document.querySelector('.article-new-header')) return;

    // 画像のプレビュー機能
    const fileInput = document.querySelector('.article-new-file-input');
    const previewArea = document.querySelector('.article-new-preview');
    fileInput.addEventListener('change', function() {
      const files = fileInput.files;
      // 既存のプレビューをクリア
      while (previewArea.firstChild) {
        previewArea.removeChild(previewArea.firstChild);
      }
      for (let i = 0; i < files.length; i++) {
        const file = files[i];
        const img = document.createElement('img');
        img.classList.add('preview-image');
        img.file = file;
        previewArea.appendChild(img);
        const reader = new FileReader();
        reader.onload = (function(aImg) {
          return function(e) {
            aImg.src = e.target.result;
          };
        })(img);
        reader.readAsDataURL(file);
      }
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
