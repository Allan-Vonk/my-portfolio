// my-portfolio/scripts/slideshow.js

let slideIndex = 0;
const slides = document.querySelectorAll('.slides');
const prevButton = document.querySelector('.prev');
const nextButton = document.querySelector('.next');

function changeSlide(n) {
    slides[slideIndex].classList.remove('active');
    slideIndex = (slideIndex + n + slides.length) % slides.length;
    slides[slideIndex].classList.add('active');
}

// Hide buttons if there's only one slide
if (slides.length <= 1) {
    prevButton.style.display = 'none';
    nextButton.style.display = 'none';
}

