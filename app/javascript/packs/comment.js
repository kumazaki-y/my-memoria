import axios from 'axios';
import $ from 'jquery';

///////////////コメントのHTMLを生成する関数を定義/////////////////
function createCommentHTML(comment, defaultAvatarUrl, currentUserId, trashIconUrl) {
	const profileLink = comment.user.id === currentUserId ? '/profile' : '/accounts/' + comment.user.id;
	const userNameToShow = comment.user.display_name || comment.user.username;

	return `
	<div class="comment" id="comment-${comment.id}">
		<div class="comment-header">
			<a href="${profileLink}">
				<img src="${comment.user.profile_image_url || defaultAvatarUrl}" alt="${userNameToShow}" class="profile-img">
			</a>
		</div>
		<div class="comment-content">
			<div class="user-and-action">
				<strong>${userNameToShow}</strong>
				${comment.is_current_user ? `<button class="delete-comment" data-comment-id="${comment.id}"><img src="${trashIconUrl}" alt="Delete" class="delete-comment" ></button>` : ''}
			</div>
			<p>${comment.content}</p>
		</div>
	</div>
	`;
}
//////////////////////////////////////////////////////////////


document.addEventListener('DOMContentLoaded', function() {

if ($('.new_comment').length > 0) {	// クラスの存在を確認
	const commentForm = $('.new_comment');
	const showCommentFormBtn = $('#show_comment_form_btn');
	const dataset = commentForm.data();
	const articleId = dataset.articleId;
	const currentUserId = "#{current_user.id}";
	const defaultAvatarUrl = document.querySelector('.comments').dataset.defaultAvatarUrl;
	const trashIconUrl = document.querySelector('.comments').dataset.trashIconUrl;


//////////////ページ読み込み時にコメントを非同期で取得/////////////////////////////
	axios.get(`/articles/${articleId}/comments`, {
		headers: {
			'Accept': 'application/json'
		}
	})
	.then(function(response) {
		const comments = response.data;
		comments.forEach(comment => {
			$('.comments').append(createCommentHTML(comment, defaultAvatarUrl, currentUserId,trashIconUrl));
		});
	})
	.catch(function(error) {
		console.log("コメントの取得に失敗しました:", error);
	});


// コメントフォームを表示するボタンのクリックイベント/////////////////////////
	showCommentFormBtn.on('click', function() {
		commentForm.css('display', 'block');
		showCommentFormBtn.css('display', 'none'); // ボタンを非表示
	});

		$('#comment_form').on('submit', function(e) {// コメントフォームの送信イベント
			e.preventDefault();
			const commentContent = $('textarea[name="comment[content]"]').val();
			const submitButton = $(this).find('button[type="submit"]');

			axios.post(`/articles/${articleId}/comments`, {
				comment: {
						content: commentContent
				}
			})
// 成功時にコメントを追加し、フォームを非表示にする////////////////////////////////
			.then(function(response) {
				const comment = response.data;
				$('.comments').prepend(createCommentHTML(comment, defaultAvatarUrl, currentUserId,trashIconUrl));

				$('textarea[name="comment[content]"]').val(''); // 入力欄をクリア
				commentForm.css('display', 'none'); // フォームを隠す
				showCommentFormBtn.css('display', 'block'); // ボタンを再表示
			})
			.catch(function(error) {
				if (error.response && error.response.data && error.response.data.errors) {
						alert(error.response.data.errors.join("\n"));
				} else {
						alert("コメントの投稿に失敗しました");
				}
			})
			.finally(function() {// 最終処理（成功・失敗に関わらず実行される）
				submitButton.prop('disabled', false);// コメント投稿ボタンを再度有効化
			});
		});


// すべての削除ボタンにイベントリスナーを設定////////////////////////////////////////
		$(document).on('click', '.delete-comment', function() {
			const commentId = $(this).data('commentId');
			if (confirm('本当に削除しますか？')) {
				axios.delete(`/articles/${articleId}/comments/${commentId}`)
				.then(response => {
					if (response.data.success) {
						$(`#comment-${commentId}`).remove(); // コメントをDOMから削除
						alert(response.data.message); // 成功メッセージの表示
					} else {
						alert(response.data.message); // エラーメッセージの表示
					}
				})
				.catch(error => {
						console.error('コメントの削除に失敗しました:', error);
				});
			}
		});
	}
});


