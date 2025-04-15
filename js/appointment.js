// Modal functionality

function openAppointmentModal(button) {
    const modal = document.getElementById('appointmentModal');
    const doctorName = button.getAttribute('data-doctor-name');
    const doctorImage = button.getAttribute('data-doctor-image');
    const specialty = button.getAttribute('data-specialty');

    // Update modal content
    document.getElementById('modalDoctorName').textContent = doctorName;
    document.getElementById('modalDoctorImage').src = doctorImage;
    document.getElementById('modalDoctorSpecialty').textContent = specialty;

    // Show modal
    modal.style.display = 'flex';
    document.body.style.overflow = 'hidden'; // Prevent background scrolling
}

function closeAppointmentModal() {
    const modal = document.getElementById('appointmentModal');
    modal.style.display = 'none';
    document.body.style.overflow = 'auto'; // Restore scrolling
}

// Close modal when clicking outside
document.addEventListener('DOMContentLoaded', () => {
    const modal = document.getElementById('appointmentModal');
    modal.addEventListener('click', (e) => {
        if (e.target === modal) {
            closeAppointmentModal();
        }
    });

    // Form validation and submission
    const appointmentForm = document.getElementById('appointmentForm');
    
    // Phone number validation
    const phoneInput = document.getElementById('patientPhone');
    phoneInput.addEventListener('input', (e) => {
        const phoneNumber = e.target.value.replace(/\D/g, '');
        e.target.value = phoneNumber.replace(/^(\d{3})(\d{3})(\d{4})$/, '($1) $2-$3');
    });

    appointmentForm.addEventListener('submit', async (e) => {
        e.preventDefault();
        
        // Validate date and time
        const dateInput = document.getElementById('appointmentDate');
        const timeInput = document.getElementById('appointmentTime');
        const selectedDateTime = new Date(`${dateInput.value} ${timeInput.value}`);
        
        if (selectedDateTime < new Date()) {
            alert('Please select a future date and time for your appointment.');
            return;
        }

        // Get form data
        const formData = new FormData(appointmentForm);
        const appointmentData = Object.fromEntries(formData.entries());

        try {
            // Show loading state
            const submitBtn = appointmentForm.querySelector('button[type="submit"]');
            const originalText = submitBtn.textContent;
            submitBtn.textContent = 'Scheduling...';
            submitBtn.disabled = true;

            // Here you would typically send the data to your backend
            // Simulating API call with timeout
            await new Promise(resolve => setTimeout(resolve, 1000));
            console.log('Appointment Data:', appointmentData);

            // Show success message
            const successMessage = document.createElement('div');
            successMessage.className = 'success-message';
            successMessage.textContent = 'Appointment scheduled successfully! We will send you a confirmation email shortly.';
            appointmentForm.insertBefore(successMessage, appointmentForm.firstChild);

            // Reset form and close modal after delay
            setTimeout(() => {
                closeAppointmentModal();
                appointmentForm.reset();
                successMessage.remove();
                submitBtn.textContent = originalText;
                submitBtn.disabled = false;
            }, 2000);

        } catch (error) {
            console.error('Error scheduling appointment:', error);
            alert('There was an error scheduling your appointment. Please try again.');
        }
    });
});

// Set minimum date for appointment
document.addEventListener('DOMContentLoaded', () => {
    const dateInput = document.getElementById('appointmentDate');
    const today = new Date().toISOString().split('T')[0];
    dateInput.min = today;
});