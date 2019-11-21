import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

const setDatePicker = () =>{
  flatpickr(".datepicker", {
    enableTime: true,
    noCalendar: true,
    time_24hr: true,
    dateFormat: "H:i"
  });
};

export { setDatePicker };
