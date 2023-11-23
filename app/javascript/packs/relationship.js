import axios from 'axios';
import $ from 'jquery';

$(function() {
    const followButton = $('.follow-btn');
    const followerCountElement = $('#follower-count');

    if (followButton.length && followerCountElement.length) {
        const userId = followButton.data('userId');

        followButton.on('click', function(event) {
            event.preventDefault();

            const isfollowing = followButton.data('relationshipStatus') === 'unfollow';
            const url = isfollowing ? `/accounts/${userId}/unfollows` : `/accounts/${userId}/follows`;

        axios.post(url)
            .then((response) => {
                if (response.data.status === 'following' || response.data.status === 'unfollowing') {
                    followButton.data('relationshipStatus', isfollowing ? 'follow' : 'unfollow')
                        .text(isfollowing ? 'Follow' : 'Unfollow')
                        .toggleClass('follow unfollow');

                    // サーバーからのレスポンス内でフォロワー数を更新
                    followerCountElement.text(response.data.followerCount);
                }
            })
            .catch((error) => {
                console.error('Error in follow/unfollow:', error);
            });
        });
    }
});

