import React, { Component } from 'react';
import { push } from 'connected-react-router';
import { Route, Switch, Redirect } from 'react-router-dom';
import qs from 'qs';
import _ from 'lodash';

import { loginSuccess, logoutSuccess } from './actions/AppActions';
import { localLoginRequest, logoutRequest, getResetPasswordInfo } from './api';
import { clearNotifications, enableTutorial } from './actions/AppActions';
import { createWindow } from './actions/WindowActions';
import { setBreadcrumb } from './actions/MenuActions';
import Translation from './components/Translation';
import BlankPage from './components/BlankPage';
import Board from './containers/Board.js';
import Dashboard from './containers/Dashboard.js';
import Calendar from './containers/Calendar';
import DocList from './containers/DocList.js';
import InboxAll from './containers/InboxAll.js';
import Login from './containers/Login.js';
import MasterWindow from './containers/MasterWindow.js';
import NavigationTree from './containers/NavigationTree.js';
import PluginContainer, { pluginWrapper } from './components/PluginContainer';
import PaypalReservationConfirm from './containers/PaypalReservationConfirm.js';

let hasTutorial = false;

export const getRoutes = (store, auth, plugins) => {
  // TODO
  // const authRequired = (nextState, replace, callback) => {
  //   hasTutorial =
  //     nextState &&
  //     nextState.location &&
  //     nextState.location.query &&
  //     typeof nextState.location.query.tutorial !== 'undefined';

  //   if (!localStorage.isLogged) {
  //     localLoginRequest().then((resp) => {
  //       if (resp.data) {
  //         store.dispatch(loginSuccess(auth));
  //         callback(null, nextState.location.pathname);
  //       } else {
  //         //redirect tells that there should be
  //         //step back in history after login
  //         store.dispatch(push('/login?redirect=true'));
  //       }
  //     });
  //   } else {
  //     if (hasTutorial) {
  //       store.dispatch(enableTutorial());
  //     }

  //     store.dispatch(clearNotifications());
  //     store.dispatch(loginSuccess(auth));

  //     callback();
  //   }
  // };

  // TODO
  const onResetEnter = (nextState, replace, callback) => {
    const token = nextState.location.query.token;

    if (!token) {
      callback(null, nextState.location.pathname);
    }

    return getResetPasswordInfo(token).then(() => {
      return Translation.getMessages().then(() => {
        callback(null, nextState.location.pathname);
      });
    });
  };

  class LogoutRoute extends Component {
    constructor(props) {
      super(props);

      this.state = {
        loggedIn: true,
      };

      console.log('LOGOUTROUTE')

      logoutRequest()
        .then(() => logoutSuccess(auth))
        .then(() => {
          console.log('redirecting to login')
          store.dispatch(push('/login'))
          // this.setState({ loggedIn: false })
        });
    }

    render() {
      // const { component: Component, ...rest } = this.props;
      // const { loggedIn } = this.state;

      // return (
      //   <Route
      //     {...rest}
      //     render={(props) => {
      //       if (loggedIn) {
      //         return <Component {...props} />;
      //       } else {
      //         //redirect tells that there should be
      //         //step back in history after login
      //         return <Redirect to="/login" />;
      //       }
      //     }}
      //   />
      // );
      // if (loggedIn) {
        return null;
      // }

      // return <Redirect to="/login" />;
    }
  }

  function setPluginBreadcrumbHandlers(routesArray, currentBreadcrumb) {
    routesArray.forEach((route) => {
      const routeBreadcrumb = [
        ...currentBreadcrumb,
        {
          caption: route.breadcrumb.caption,
          type: route.breadcrumb.type,
        },
      ];

      route.onEnter = () => store.dispatch(setBreadcrumb(routeBreadcrumb));

      if (route.childRoutes) {
        setPluginBreadcrumbHandlers(route.childRoutes, routeBreadcrumb);
      }
    });
  }

  const getPluginsRoutes = (plugins) => {
    if (plugins.length) {
      const routes = plugins.map((plugin) => {
        if (plugin.routes && plugin.routes.length) {
          const pluginRoutes = [...plugin.routes];
          const ParentComponent = pluginRoutes[0].component;

          // wrap main plugin component in a HOC that'll render it
          // inside the app using a Container element
          if (ParentComponent.name !== 'WrappedPlugin') {
            const wrapped = pluginWrapper(PluginContainer, ParentComponent);

            pluginRoutes[0].component = wrapped;

            if (pluginRoutes[0].breadcrumb) {
              setPluginBreadcrumbHandlers(pluginRoutes, []);
            }
          }

          return pluginRoutes[0];
        }

        return [];
      });

      return routes;
    }

    return [];
  };
  const pluginRoutes = getPluginsRoutes(plugins);

  function DocListRoute({ location, match }) {
    const query = qs.parse(location.search);

    return <DocList query={query} windowId={match.params.windowId} />;
  }
  function BoardRoute({ location, match }) {
    const query = qs.parse(location.search);

    return <Board query={query} boardId={match.params.boardId} />;
  }

  class MasterWindowRoute extends Component {
    constructor(props) {
      super(props);

      const {
        match: { params },
      } = props;

      store.dispatch(createWindow(params.windowId, params.docId));
    }

    render() {
      return <MasterWindow {...this.props} params={this.props.match.params} />;
    }
  }

  const PrivateRoute = ({ component: Component, ...rest }) => (
    <Route
      {...rest}
      render={(props) => {
        const { location } = props;
        const query = qs.parse(location.search, { ignoreQueryPrefix: true });

        // console.log('COMPONENT: ', localStorage.isLogged)

        hasTutorial = query && typeof query.tutorial !== 'undefined';

        if (!localStorage.isLogged) {
          console.log('1');
          localLoginRequest().then((resp) => {
            console.log('2')
            if (resp.data) {
              console.log('3: ', resp.data)
              store.dispatch(loginSuccess(auth));

              return <Component {...props} />;
            } else {
              console.log('4');
              //redirect tells that there should be
              //step back in history after login
              store.dispatch(push('/login?redirect=true'))
            }
          });
        } else {
          console.log('5')
          if (hasTutorial) {
            store.dispatch(enableTutorial());
          }

          store.dispatch(clearNotifications());
          store.dispatch(loginSuccess(auth));

          return <Component {...props} />;
        }
      }}
    />
  );

  const childRoutes = (
    <Switch>
      <PrivateRoute exact path="/" component={Dashboard} />
      <PrivateRoute
        path="/window/:windowId/:docId"
        component={MasterWindowRoute}
      />
      <PrivateRoute path="/window/:windowId" component={DocListRoute} />
      <PrivateRoute path="/sitemap" component={NavigationTree} />
      <PrivateRoute path="/board/:boardId" component={BoardRoute} />
      <PrivateRoute path="/inbox" component={InboxAll} />
      <Route
        path="/logout"
        render={() => {
          console.log('BLA: ', localStorage.isLogged)
          if (localStorage.isLogged) {
            logoutRequest()
              .then(() => logoutSuccess(auth))
              .then(() => {
                console.log('store dispatch');
                store.dispatch(push('/login'));
              });

            return null;
          }

          return <Redirect to="/login" />;
        }}
      />
      {pluginRoutes}
      <Route path="*" component={BlankPage} />
    </Switch>
  );

  class Index extends Component {
    shouldComponentUpdate(nextProps) {
      const { location } = this.props;
      const { location: nextLocation } = nextProps;

      if (_.isEqual(location, nextLocation)) {
        return false;
      }
      return true;
    }

    render() {
      return childRoutes;
    }
  }

  return (
    <Switch>
      <Route
        path="/login"
        component={({ location }) => {
          console.log('LOGIN !!')
          const query = qs.parse(location.search, { ignoreQueryPrefix: true });
          return (
            <Login
              redirect={query.redirect}
              logged={localStorage.getItem('isLogged') === 'true'}
              {...{ auth }}
            />
          );
        }}
      />
      <Route
        path="/forgottenPassword"
        component={({ location }) => (
          <Login splat={location.pathname.replace('/', '')} {...{ auth }} />
        )}
      />
      <Route
        path="/resetPassword"
        onEnter={onResetEnter}
        component={({ location }) => {
          const query = qs.parse(location.search, { ignoreQueryPrefix: true });
          return (
            <Login
              splat={location.pathname.replace('/', '')}
              token={query.token}
              {...{ auth }}
            />
          );
        }}
      />
      <Route
        path="/paypal_confirm"
        component={({ location }) => {
          const query = qs.parse(location.search, { ignoreQueryPrefix: true });
          return <PaypalReservationConfirm token={query.token} {...{ auth }} />;
        }}
      />
      <Route path="/calendar" component={Calendar} />
      <Route path="/" component={Index} />
      <Route path="*" component={BlankPage} />
    </Switch>
  );
};
