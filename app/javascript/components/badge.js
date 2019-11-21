const badgeTag = document.getElementById('bookings_pending');
const userIdTag = document.getElementById('user_id');
const url = `/bookings/${userIdTag.dataset.userId}/number_of_notifications`;

const setNotificationsUpdates = () => {
  setInterval(() => {
    fetch(url)
      .then((response) => response.json())
      .then((data) => {
        if (data.notifications > 0) {
          badgeTag.innerText = data.notifications;
          badgeTag.classList.remove("d-none");
        }
        else {
          badgeTag.classList.add("d-none");
        }
      });
  }, 1000);
};

export { setNotificationsUpdates };
