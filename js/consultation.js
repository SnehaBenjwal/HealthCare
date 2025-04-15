// Specialist Filtering
const filterButtons = document.querySelectorAll('.filter-btn');
const doctorCards = document.querySelectorAll('.doctor-card');

filterButtons.forEach(button => {
    button.addEventListener('click', () => {
        // Remove active class from all buttons
        filterButtons.forEach(btn => btn.classList.remove('active'));
        // Add active class to clicked button
        button.classList.add('active');

        const filter = button.getAttribute('data-filter');

        doctorCards.forEach(card => {
            if (filter === 'all' || card.getAttribute('data-specialty') === filter) {
                card.style.display = 'block';
            } else {
                card.style.display = 'none';
            }
        });
    });
});

// Initialize AOS for this page
AOS.init({
    duration: 1000,
    once: true,
    offset: 100
});