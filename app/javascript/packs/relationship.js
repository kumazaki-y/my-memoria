import axios from 'axios';
import $ from 'jquery';

document.addEventListener('DOMContentLoaded', () => {
    const followButton = document.querySelector('.follow-btn');
    const followerCountElement = document.getElementById('follower-count');

    if (followButton && followerCountElement) {
        const userId = followButton.dataset.userId;

        followButton.addEventListener('click', (event) => {
            event.preventDefault();

            const isfollowing = followButton.dataset.relationshipStatus === 'unfollow';
            const url = isfollowing ? `/accounts/${userId}/unfollows` : `/accounts/${userId}/follows`;
            const method = 'POST';

            axios({ method, url })
                .then((response) => {
                    if (response.data.status === 'following' || response.data.status === 'unfollowing') {
                        followButton.dataset.relationshipStatus = isfollowing ? 'follow' : 'unfollow';
                        followButton.textContent = isfollowing ? 'Follow' : 'Unfollow';
                        followButton.classList.toggle('follow');
                        followButton.classList.toggle('unfollow');

                        // サーバーからのレスポンス内でフォロワー数を更新
                        followerCountElement.textContent = response.data.followerCount;
                    }
                })
                .catch((error) => {
                    console.error('Error in follow/unfollow:', error);
                });
        });
    }
});

