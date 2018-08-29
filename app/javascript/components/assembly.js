function assembly() {
  document.addEventListener('DOMContentLoaded', () => {
    const add1_btn = document.getElementById("add_assembly1");
    add1_btn.addEventListener("click", (event) => {
      event.currentTarget.parentNode.querySelector(".assembly-div-addable").classList.remove('inactive');
      event.currentTarget.classList.add('inactive');
      document.getElementById("addable2").classList.remove('inactive');
    });

    const add2_btn = document.getElementById("add_assembly2");
    add2_btn.addEventListener("click", (event) => {
      event.currentTarget.parentNode.querySelector(".assembly-div-addable").classList.remove('inactive');
      event.currentTarget.classList.add('inactive');
      document.getElementById("addable3").classList.remove('inactive');
    });

    const add3_btn = document.getElementById("add_assembly3");
    add3_btn.addEventListener("click", (event) => {
      event.currentTarget.parentNode.querySelector(".assembly-div-addable").classList.remove('inactive');
      event.currentTarget.classList.add('inactive');
      document.getElementById("addable4").classList.remove('inactive');
    });

    const add4_btn = document.getElementById("add_assembly4");
    add4_btn.addEventListener("click", (event) => {
      event.currentTarget.parentNode.querySelector(".assembly-div-addable").classList.remove('inactive');
      event.currentTarget.classList.add('inactive');
      document.getElementById("addable5").classList.remove('inactive');
    });

    const add5_btn = document.getElementById("add_assembly5");
    add5_btn.addEventListener("click", (event) => {
      event.currentTarget.parentNode.querySelector(".assembly-div-addable").classList.remove('inactive');
      event.currentTarget.classList.add('inactive');
    });
  });
};

assembly();

export { assembly };
