import axios from 'axios';

document.addEventListener('DOMContentLoaded', () => {
    const fileInput = document.getElementById('avatarInput');
    const profileAvatar = document.querySelector('.profile-avatar');
    
    // プロフィール画像がクリックされた時のイベント（profile-avatarが存在する場合のみ）
    if (profileAvatar) {
        profileAvatar.addEventListener('click', () => {
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
    }
});