import React, { useState, createContext } from 'react';

export const UserContext = createContext();

const UserContextProvider = ({ children }) => {
    const [userName, setUserName] = useState("初期ユーザー");

    const updateUserName = (newName) => {
        setUserName(newName);
    };

    return (
        <UserContext.Provider value={{ userName, updateUserName }}>
            {children}
        </UserContext.Provider>
    );
};

export default UserContextProvider;
