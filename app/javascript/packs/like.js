import axios from 'axios';
import $ from 'jquery';

$(function() {
  $('.like-icons').each(function() {
    const iconContainer = $(this);
    const articleId = iconContainer.data('articleId');
    const inactiveIcon = iconContainer.find('.like-button-inactive');
    const activeIcon = iconContainer.find('.like-button-active');

    inactiveIcon.on('click', function() {
      axios.post(`/articles/${articleId}/like`)
        .then((response) => {
          if (response.data.status === 'liked') {
            inactiveIcon.hide();
            activeIcon.show();
          }
        })
        .catch((error) => {
          console.error('Error liking the article:', error);
        });
    });

    activeIcon.on('click', function() {
      axios.delete(`/articles/${articleId}/like`)
        .then((response) => {
          if (response.data.status === 'unliked') {
            inactiveIcon.show();
            activeIcon.hide();
          }
        })
        .catch((error) => {
          console.error('Error unliking the article:', error);
        });
    });
  });
});
