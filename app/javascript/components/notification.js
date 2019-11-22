const closeNotifListener = () => {
  const alertTag = document.querySelector('.alert');
  const closeTag = document.querySelector('.close');

  closeTag.addEventListener('click', (event) => {
    alertTag.classList.add('d-none');
  });
};

export { closeNotifListener };
