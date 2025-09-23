const express = require('express');
const app = express();
app.get('/', (req, res) => {
    res.json([
        { id: 11, employeeName: 'John Doltan and Moosa Waseim', salary: 2500 },
        { id: 13, employeeName: 'Phillaps Trace', salary: 1400 },
        { id: 14, employeeName: 'Donald Trumph', salary: 1200 },
        { id: 99, employeeName: 'Muhammad Tanzeem Bhaaati', salary: 2500 },
    ]);
});

app.listen(4000, () => {
console.log('Server is running on port 4000');
}) 