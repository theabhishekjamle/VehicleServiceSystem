document.addEventListener('DOMContentLoaded', function () {
  const dayList = document.getElementById("day-list");
  const displayDate = document.getElementById("display-date");
  const inputDate = document.getElementById("selected-date");
  const inputTime = document.getElementById("selected-time");
  let currentDate = new Date();

  const formatReadableDate = (date) => {
    return date.toLocaleDateString(undefined, { weekday: 'long', month: 'short', day: 'numeric' });
  };

  function loadDays() {
    dayList.innerHTML = "";
    for (let i = 0; i < 7; i++) {
      const day = new Date();
      day.setDate(currentDate.getDate() + i);
      const item = document.createElement("div");
      item.className = "calendar-day" + (i === 0 ? " active" : "");
      item.dataset.date = formatReadableDate(day);
      item.innerHTML = `<div>${day.toLocaleDateString(undefined, { weekday: 'short' })}</div><div>${day.getDate()}</div>`;
      if (i === 0) {
        inputDate.value = formatReadableDate(day);
        displayDate.textContent = formatReadableDate(day);
      }
      dayList.appendChild(item);
    }
  }

  const populateSlots = (times, containerId) => {
    const container = document.getElementById(containerId);
    container.innerHTML = "";
    times.forEach(time => {
      const btn = document.createElement("div");
      btn.className = "slot-time";
      btn.textContent = time;
      btn.addEventListener("click", () => {
        document.querySelectorAll(".slot-time").forEach(e => e.classList.remove("selected"));
        btn.classList.add("selected");
        inputTime.value = time;
      });
      container.appendChild(btn);
    });
  };

  const morningSlots = ["8:00 AM", "8:30 AM", "9:00 AM", "10:00 AM", "11:00 AM"];
  const afternoonSlots = ["12:00 PM", "1:00 PM", "2:00 PM", "3:00 PM", "4:00 PM"];

  document.getElementById("prev-day").addEventListener("click", () => {
    currentDate.setDate(currentDate.getDate() - 1);
    loadDays();
  });

  document.getElementById("next-day").addEventListener("click", () => {
    currentDate.setDate(currentDate.getDate() + 1);
    loadDays();
  });

  dayList.addEventListener("click", (e) => {
    const day = e.target.closest(".calendar-day");
    if (day) {
      document.querySelectorAll(".calendar-day").forEach(d => d.classList.remove("active"));
      day.classList.add("active");
      inputDate.value = day.dataset.date;
      displayDate.textContent = day.dataset.date;
    }
  });

  document.getElementById("slot-booking-form").addEventListener("submit", function (e) {
    e.preventDefault();
    const formData = {
      name: document.getElementById("customer-name").value,
      phone: document.getElementById("contact-number").value,
      vehicle: document.getElementById("vehicle-number").value,
      services: Array.from(document.getElementById("service-select").selectedOptions).map(o => o.value),
      date: inputDate.value,
      time: inputTime.value
    };
    console.log("Booking Info:", formData);
    alert(`Booking Confirmed for ${formData.date} at ${formData.time}`);
  });

  // Initial Load
  loadDays();
  populateSlots(morningSlots, "morning-slot-list");
  populateSlots(afternoonSlots, "afternoon-slot-list");
});

