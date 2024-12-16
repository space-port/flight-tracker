const express = require('express');
const app = express();
const port = 5000;

// Mock flight data
const flights = [
    { id: 1, origin: 'Los Angeles', destination: 'New York', status: 'On Time' },
    { id: 2, origin: 'San Francisco', destination: 'Chicago', status: 'Delayed' },
    { id: 3, origin: 'Houston', destination: 'Miami', status: 'Cancelled' },
    { id: 4, origin: 'Toronto', destination: 'Tel Aviv', status: 'Cancelled' }
];

// Endpoint to get all flights
app.get('/api/flights', (req, res) => {
    res.json(flights);
});

// Health check endpoint
app.get('/', (req, res) => {
    res.send('Flight Tracker Backend is running!');
});

app.listen(port, () => {
    console.log(`Flight Tracker backend is listening at http://localhost:${port}`);
});
