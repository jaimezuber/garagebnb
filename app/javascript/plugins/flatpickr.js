import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    minDate: "today",
    altInput: true,
    allowInput: true,
  });
}

export { initFlatpickr };
