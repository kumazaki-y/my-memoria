// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import Rails from "@rails/ujs";
import axios from 'axios';
import { csrfToken } from '@rails/ujs';

Rails.start();

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken();


document.addEventListener('DOMContentLoaded', () => {
    const fileInput = document.getElementById('avatarInput');
    
    // プロフィール画像がクリックされた時のイベント
    document.querySelector('.profile-avatar').addEventListener('click', () => {
        fileInput.click();
    });
  
    // ファイルが選択されたらサーバにアップロード
    fileInput.addEventListener('change', (event) => {
                // キャンセル操作が行われた場合
        if (!event.target.files.length) {
            console.log('No file selected. Cancelled.');
            return; // 処理を中断
        }
        
        const formData = new FormData();
        formData.append('profile[avatar]', event.target.files[0]);

        axios.patch('/profile', formData)
            .then((response) => {
                if (response.data.status === 'success') {
                    if (response.data.image_url) { 
                        document.querySelector('.profile-avatar').src = response.data.image_url;
                    } else {
                        document.querySelector('.profile-avatar').src = "app/assets/images/Rectangle.png";
                        console.error('image_url is not set in response.');
                    }
                } else {
                    console.error('Failed to upload image:', response.data.message || 'Unknown error');
                }
            })
            .catch((error) => {
                alert('エラーが発生しました：' + error);
            });
    });
});

