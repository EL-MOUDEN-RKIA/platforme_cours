
    const teacherTab = document.getElementById("teacherTab");
    const studentTab = document.getElementById("studentTab");
    const teacherForm = document.getElementById("teacherForm");
    const studentForm = document.getElementById("studentForm");

    teacherTab.addEventListener("click", () => {
    teacherTab.classList.add("active");
    studentTab.classList.remove("active");
    teacherForm.classList.add("active");
    studentForm.classList.remove("active");
});

    studentTab.addEventListener("click", () => {
    studentTab.classList.add("active");
    teacherTab.classList.remove("active");
    studentForm.classList.add("active");
    teacherForm.classList.remove("active");
});
