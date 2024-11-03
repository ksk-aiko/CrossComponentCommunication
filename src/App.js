import React from 'react';
import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom';
import UserContextProvider from './UserContextProvider';
import Home from './Home';
import About from './About';

function App() {
    return (
        <UserContextProvider>
            <Router>
                <nav>
                    <Link to="/">Home</Link> | <Link to="/about">About</Link>
                </nav>
                <Routes>
                    <Route path="/" element={<Home />} />
                    <Route path="/about" element={<About />} />
                </Routes>
            </Router>
        </UserContextProvider>
    );
}

export default App;
