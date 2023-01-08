import React from 'react';

import App from './app';
import {createRoot} from 'react-dom/client';


const renderApp = () => {
    const rootElement = document.getElementById('root');
    const rootContainer = createRoot(rootElement);
    rootContainer.render(<App/>);
};

renderApp();
