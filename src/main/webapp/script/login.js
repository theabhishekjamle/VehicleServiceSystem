const loginBtn = document.getElementById("loginToggle");
    const signupBtn = document.getElementById("signupToggle");
    const loginForm = document.getElementById("loginForm");
    const signupForm = document.getElementById("signupForm");

    function switchForm(target) {
      if (target === "signup") {
        signupForm.classList.add("active");
        loginForm.classList.remove("active");
        signupBtn.classList.add("active");
        loginBtn.classList.remove("active");
      } else {
        loginForm.classList.add("active");
        signupForm.classList.remove("active");
        loginBtn.classList.add("active");
        signupBtn.classList.remove("active");
      }
    }

    loginBtn.addEventListener("click", () => switchForm("login"));
    signupBtn.addEventListener("click", () => switchForm("signup"));


