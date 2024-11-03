import React, { useContext } from 'react';
import { UserContext } from './UserContextProvider';

const Home = () => {
    const { userName } = useContext(UserContext);

    return (
        <div>
            <h1>Welcome, {userName}!</h1>
            <p>This is the home page.</p>
        </div>
    );
};

export default Home;
