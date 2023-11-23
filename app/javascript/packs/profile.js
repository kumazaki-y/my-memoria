import axios from 'axios';
import $ from 'jquery';

$(function() {
    const fileInput = $('#avatarInput');
    const profileAvatar = $('.profile-avatar');
    
    // プロフィール画像がクリックされた時のイベント
    profileAvatar.on('click', function() {
        fileInput.click();
    });

    // ファイルが選択されたらサーバにアップロード
    fileInput.on('change', function(event) {
        // キャンセル操作が行われた場合
        if (!this.files.length) {
            console.log('No file selected. Cancelled.');
            return; // 処理を中断
        }
        
        const formData = new FormData();
        formData.append('profile[avatar]', this.files[0]);

        axios.patch('/profile', formData)
            .then((response) => {
                if (response.data.status === 'success') {
                    if (response.data.image_url) { 
                        profileAvatar.attr('src', response.data.image_url);
                    } else {
                        profileAvatar.attr('src', "app/assets/images/Rectangle.png");
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
