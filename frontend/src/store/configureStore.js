// import { routerMiddleware } from 'react-router-redux';
import { routerMiddleware } from 'connected-react-router';
import { applyMiddleware, compose } from 'redux';
import { createStore } from 'redux-dynamic-reducer';
import thunk from 'redux-thunk';
import promiseMiddleware from 'redux-promise';

import navigationMiddleware from './customMiddlewares';
// import rootReducer from '../reducers';
import { createRootReducer } from '../reducers';

export default function configureStore(history) {
  const middleware = [
    thunk,
    promiseMiddleware,
    navigationMiddleware,
    routerMiddleware(history),
  ];

  const composeEnhancer =
    window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;

  const store = createStore(
    null,
    composeEnhancer(applyMiddleware(...middleware))
  );

  // store.attachReducers(rootReducer);
  store.attachReducers(createRootReducer(history));

  if (module.hot) {
    module.hot.accept('../reducers', () => {
      // const nextReducer = rootReducer;
      const nextReducer = createRootReducer(history);
      store.replaceReducer(nextReducer);
    });
  }

  if (window.Cypress) {
    window.Cypress.emit('emit:reduxStore', store);
  }

  return store;
}
