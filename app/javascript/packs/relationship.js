import axios from 'axios';
import $ from 'jquery';

document.addEventListener('DOMContentLoaded', () => {
    const followButton = document.querySelector('.follow-btn');
    const followerCountElement = document.getElementById('follower-count');

    if (followButton && followerCountElement) {
        const userId = followButton.dataset.userId;

        followButton.addEventListener('click', (event) => {
            event.preventDefault();

            const isfollowed = followButton.dataset.relationshipStatus === 'unfollow';
            const url = isfollowed ? `/accounts/${userId}/unfollows` : `/accounts/${userId}/follows`;
            const method = 'POST';

            axios({ method, url })
                .then((response) => {
                    if (response.data.status === 'followed' || response.data.status === 'unfollowed') {
                        followButton.dataset.relationshipStatus = isfollowed ? 'follow' : 'unfollow';
                        followButton.textContent = isfollowed ? 'Follow' : 'Unfollow';
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

