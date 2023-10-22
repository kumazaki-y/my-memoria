import axios from 'axios';

document.addEventListener('DOMContentLoaded', () => {
    const likeIcons = document.querySelectorAll('.like-icons');
  
    likeIcons.forEach((iconContainer) => {
      const articleId = iconContainer.dataset.articleId;  // HTMLにdata-article-idを設定しておく必要があります
      const inactiveIcon = iconContainer.querySelector('.like-button-inactive');
      const activeIcon = iconContainer.querySelector('.like-button-active');
  
      inactiveIcon.addEventListener('click', () => {
        axios.post(`/articles/${articleId}/like`)
          .then((response) => {
            if (response.data.status === 'liked') {
              inactiveIcon.style.display = 'none';
              activeIcon.style.display = 'block';
            }
          })
          .catch((error) => {
            console.error('Error liking the article:', error);
          });
      });
  
      activeIcon.addEventListener('click', () => {
        axios.delete(`/articles/${articleId}/like`)
          .then((response) => {
            if (response.data.status === 'unliked') {
              inactiveIcon.style.display = 'block';
              activeIcon.style.display = 'none';
            }
          })
          .catch((error) => {
            console.error('Error unliking the article:', error);
          });
      });
    });
  });
  