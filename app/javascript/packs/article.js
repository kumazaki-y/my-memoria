import axios from 'axios';

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
