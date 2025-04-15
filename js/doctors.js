// Search Functionality
const searchInput = document.querySelector('.search-box input');
const doctorProfiles = document.querySelectorAll('.doctor-profile');

searchInput.addEventListener('input', (e) => {
    const searchTerm = e.target.value.toLowerCase();
    
    doctorProfiles.forEach(profile => {
        const doctorName = profile.querySelector('h3').textContent.toLowerCase();
        const specialty = profile.querySelector('.specialty').textContent.toLowerCase();
        
        if (doctorName.includes(searchTerm) || specialty.includes(searchTerm)) {
            profile.style.display = 'block';
        } else {
            profile.style.display = 'none';
        }
    });
});

// Department Filter
const departmentFilter = document.querySelector('.department-filter select');

departmentFilter.addEventListener('change', (e) => {
    const selectedDepartment = e.target.value;
    
    doctorProfiles.forEach(profile => {
        const specialty = profile.querySelector('.specialty').textContent.toLowerCase();
        
        if (selectedDepartment === '' || specialty.includes(selectedDepartment)) {
            profile.style.display = 'block';
        } else {
            profile.style.display = 'none';
        }
    });
});

// Department Distribution Chart
const ctx = document.getElementById('departmentChart').getContext('2d');

const data = {
    labels: ['General Medicine', 'Cardiology', 'Neurology', 'Pediatrics', 'Other'],
    datasets: [{
        data: [30, 25, 20, 15, 10],
        backgroundColor: [
            'rgba(74, 144, 226, 0.8)',
            'rgba(54, 162, 235, 0.8)',
            'rgba(255, 206, 86, 0.8)',
            'rgba(75, 192, 192, 0.8)',
            'rgba(153, 102, 255, 0.8)'
        ],
        borderColor: [
            'rgba(74, 144, 226, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            'rgba(75, 192, 192, 1)',
            'rgba(153, 102, 255, 1)'
        ],
        borderWidth: 1
    }]
};

const config = {
    type: 'pie',
    data: data,
    options: {
        responsive: true,
        maintainAspectRatio: true, // Ensures the chart maintains its aspect ratio
        plugins: {
            legend: {
                position: 'right',
            },
            title: {
                display: true,
                text: 'Department Distribution'
            }
        },
        animation: {
            animateScale: true,
            animateRotate: true
        }
    }
};

new Chart(ctx, config);

// Initialize AOS for this page
AOS.init({
    duration: 1000,
    once: true,
    offset: 100
}); 

document.querySelectorAll('.book-btn').forEach(button => {
    button.addEventListener('click', function(event) {
        event.preventDefault();
        const modal = document.getElementById('appointmentModal');
        const doctorCard = this.closest('.doctor-profile');
        const doctorName = doctorCard.querySelector('h3').textContent;
        const specialty = doctorCard.querySelector('.specialty').textContent;
        const doctorImage = doctorCard.querySelector('.doctor-image img').src;
        
        document.getElementById('modalDoctorName').textContent = doctorName;
        document.getElementById('modalDoctorSpecialty').textContent = specialty;
        document.getElementById('modalDoctorImage').src = doctorImage;
        
        modal.classList.remove('hidden');
        modal.classList.add('flex');
        document.body.style.overflow = 'hidden';
    });
});

function closeAppointmentModal() {
    const modal = document.getElementById('appointmentModal');
    modal.classList.remove('flex');
    modal.classList.add('hidden');
    document.body.style.overflow = 'auto';
}

// Close modal when clicking outside
document.addEventListener('DOMContentLoaded', () => {
    const modal = document.getElementById('appointmentModal');
    modal.addEventListener('click', (e) => {
        if (e.target === modal) {
            closeAppointmentModal();
        }
    });
});