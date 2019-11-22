const badgeTag = document.getElementById('bookings_pending');
const userIdTag = document.getElementById('user_id');
const alertDivTag = document.querySelector('.alert');
const alertMessageTag = document.querySelector('.alert-message');

const url = `/bookings/${userIdTag.dataset.userId}/number_of_notifications`;
let pastNotifs = 0;

const setNotificationsUpdates = () => {
  setInterval(() => {
    if (userIdTag.dataset.userId) {
      fetch(url)
        .then((response) => response.json())
        .then((data) => {
          if (pastNotifs != data.notifications) {
            pastNotifs = data.notifications;
            alertMessageTag.innerText = "Vous avez une nouvelle demande de réservation !";
            alertDivTag.classList.remove('d-none');
            alertDivTag.classList.add('animated');
            alertDivTag.classList.add('bounceInRight');
          }
          if (data.notifications > 0) {
            badgeTag.innerText = data.notifications;
            badgeTag.classList.remove("d-none");
          }
          else {
            badgeTag.classList.add("d-none");
          }
        });
    }
  }, 1000);
};

export { setNotificationsUpdates };
