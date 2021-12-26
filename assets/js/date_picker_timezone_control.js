function validDate(date) {
  return !isNaN(date) && date instanceof Date;
}

function submitTimes(ids) {
  // Convert times from local to UTC before form submission
  ids.map((x) => {
    let current_element = document.getElementById(x);
    let local_time = current_element.value;
    let utc_time = new Date(local_time).toISOString();
    current_element.value = utc_time;
  });
  return true;
}

let flatpickrOptions = {
  altInput: true,
  altFormat: "F j, Y H:i",
  enableTime: true,
  dateFormat: "Y-m-d H:i",
  time_24hr: true
};


export {validDate, flatpickrOptions, submitTimes}