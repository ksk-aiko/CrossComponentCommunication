import React, { useContext } from 'react';
import { UserContext } from './UserContextProvider';

const About = () => {
    const { userName, updateUserName } = useContext(UserContext);

    const handleChangeUserName = () => {
        const newName = prompt("Enter new user name:");
        if (newName) {
            updateUserName(newName);
        }
    };

    return (
        <div>
            <h1>About Page</h1>
            <p>Current User Name: {userName}</p>
            <button onClick={handleChangeUserName}>Change User Name</button>
        </div>
    );
};

export default About;
