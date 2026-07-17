const logos = [
    "bootstrap-48.png",
    "css-logo-64.png",
    "git-48.png",
    "html5-48.png",
    "javascript-48.png",
    "jupyter-48.png",
    "linux-48.png",
    "mongodb-48.png",
    "power-bi-48.png",
    "python-48.png"
];

const container = document.querySelector('.skill-container');

logos.forEach(logo => {
    container.innerHTML += `
        <div class="skill-card">
            <img src="logos/${logo}" alt="Icon">
        </div>
    `;
});

document.getElementById('contact-form').addEventListener('submit', function(event) {
    event.preventDefault();

    const name = document.getElementById('name').value.trim();
    const email = document.getElementById('email').value.trim();
    const subject = document.getElementById('subject').value.trim();
    const message = document.getElementById('message').value.trim();
    const formMessage = document.getElementById('form-message');

    if (name === '' || email === '' || subject === '' || message === '') {
        formMessage.style.color = 'red';
        formMessage.textContent = 'Please fill in all fields.';
    } else {
        formMessage.style.color = '#dbaaf4';
        formMessage.textContent = 'Message sent successfully!';
        document.getElementById('contact-form').reset();
    }
});



const backBtn = document.getElementById('backToTop');
window.onscroll = function() {
    if (document.body.scrollTop > 400 || document.documentElement.scrollTop > 400) {
        backBtn.style.display = "block";
    } else {
        backBtn.style.display = "none";
    }
};
backBtn.addEventListener('click', () => {
    window.scrollTo({top: 0, behavior: 'smooth'});
});

window.addEventListener('load', () => {
    const loader = document.querySelector('.loader-wrapper');
    loader.classList.add('fade-out');
});