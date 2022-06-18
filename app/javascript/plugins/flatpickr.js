import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    minDate: "today",
    altInput: true,
    allowInput: true
  });
}

export { initFlatpickr };
