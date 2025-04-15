// Patients Served Chart
const ctx = document.getElementById('patientsChart').getContext('2d');

// Sample data - replace with actual data
const data = {
    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    datasets: [{
        label: 'Patients Served',
        data: [120, 190, 300, 500, 200, 300, 400, 500, 600, 700, 800, 900],
        backgroundColor: 'rgba(74, 144, 226, 0.2)',
        borderColor: 'rgba(74, 144, 226, 1)',
        borderWidth: 2,
        tension: 0.4,
        fill: true
    }]
};

const config = {
    type: 'line',
    data: data,
    options: {
        responsive: true,
        plugins: {
            legend: {
                position: 'top',
            },
            title: {
                display: true,
                text: 'Patients Served Over Time'
            }
        },
        scales: {
            y: {
                beginAtZero: true,
                title: {
                    display: true,
                    text: 'Number of Patients'
                }
            },
            x: {
                title: {
                    display: true,
                    text: 'Months'
                }
            }
        },
        animation: {
            duration: 2000,
            easing: 'easeInOutQuart'
        }
    }
};

// Ensure the chart remains visible and reinitialize if necessary
window.addEventListener('load', () => {
    const chartElement = document.getElementById('patientsChart');
    if (!chartElement) {
        console.error('Chart element not found!');
        return;
    }

    const ctx = chartElement.getContext('2d');
    if (!ctx) {
        console.error('Chart context not available!');
        return;
    }

    // Reinitialize the chart if it disappears
    new Chart(ctx, config);
});