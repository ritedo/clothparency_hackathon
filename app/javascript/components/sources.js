function sources() {
  document.addEventListener('DOMContentLoaded', () => {
    const allThemes = document.querySelectorAll(".impact-materiaux-criteria");
    Array.from(allThemes).forEach((theme) => {
      theme.addEventListener("click", (event) => {
        event.currentTarget.parentNode.querySelector(".sources-list").classList.toggle('inactive');
        event.currentTarget.parentNode.querySelector(".fa-chevron-up").classList.toggle('inactive');
        event.currentTarget.parentNode.querySelector(".fa-chevron-down").classList.toggle('inactive');
      });
    });
  });
};

sources();

export { sources };
