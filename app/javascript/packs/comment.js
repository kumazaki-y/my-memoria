import axios from 'axios';
import $ from 'jquery';

document.addEventListener('DOMContentLoaded', function() {

    // コメントフォームを表示するボタンのクリックイベント
    $('#show_comment_form_btn').on('click', function() {
        $('.new_comment').css('display', 'block');
    });
    
    const dataset = $('.new_comment').data();
    const articleId = dataset.articleId;

    // ページの読み込み時にコメントを非同期的に取得して表示
    axios.get(`/articles/${articleId}/comments`)
    .then(function(response) {
        const comments = response.data;
        comments.forEach(comment => {
            $('.comments').append(`
                <div class="comment">
                    <div class="comment-header">
                        <img src="${comment.user_profile_image}" alt="${comment.user_username}" class="profile-img">
                    </div>
                    <div class="comment-content">
                        <strong>${comment.user_username}</strong>
                        <p>${comment.content}</p>
                    </div>
                </div>
            `);
        });
    })
    .catch(function(error) {
        console.log("コメントの取得に失敗しました:", error);
    });

    $('#comment_form').on('submit', function(e) {
        e.preventDefault();

        const commentContent = $('textarea[name="comment[content]"]').val();

        axios.post(`/articles/${articleId}/comments`, {
            comment: {
                content: commentContent
            }
        })
        .then(function(response) {
            const comment = response.data;
            
            $('.comments').prepend(`
                <div class="comment">
                <div class="comment-header">
                    <img src="${comment.user_profile_image}" alt="${comment.user_username}" class="profile-img">
                </div>
                <div class="comment-content">
                    <strong>${comment.user_username}</strong>
                    <p>${comment.content}</p>
                </div>
            </div>
            `);
            
            $('textarea[name="comment[content]"]').val(''); // 入力欄をクリア
        })
        .catch(function(error) {
            // エラー時の処理
            if (error.response && error.response.data && error.response.data.errors) {
                alert(error.response.data.errors.join("\n"));
            } else {
                alert("コメントの投稿に失敗しました");
            }
        });
    });
});
