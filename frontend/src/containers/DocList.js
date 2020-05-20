import PropTypes from 'prop-types';
import React, { Component } from 'react';
import { connect } from 'react-redux';
import { withRouter } from 'react-router-dom';
import qs from 'qs';
import classnames from 'classnames';

import { updateUri } from '../actions/AppActions';
import { getWindowBreadcrumb } from '../actions/MenuActions';
import {
  selectTableItems,
  setLatestNewDocument,
} from '../actions/WindowActions';
import Container from '../components/Container';
import DocumentList from '../components/app/DocumentList';
import Overlay from '../components/app/Overlay';
import _ from 'lodash';

/**
 * @file Class based component.
 * @module DocList
 * @extends Component
 */
class DocList extends Component {
  shouldComponentUpdate(nextProps) {
    const { query } = this.props;
    const { query: nextQuery } = nextProps;

    if (_.isEqual(query, nextQuery)) {
      return false;
    }

    return true;
  }

  componentDidMount = () => {
    const {
      windowId,
      latestNewDocument,
      query,
      getWindowBreadcrumb,
      setLatestNewDocument,
      selectTableItems,
    } = this.props;

    getWindowBreadcrumb(windowId);

    if (latestNewDocument) {
      selectTableItems({
        windowType: windowId,
        viewId: query.viewId,
        ids: [latestNewDocument],
      });
      setLatestNewDocument(null);
    }
  };

  componentDidUpdate = (prevProps) => {
    const { windowId, getWindowBreadcrumb } = this.props;

    if (prevProps.windowId !== windowId) {
      getWindowBreadcrumb(windowId);
    }
  };

  /**
   * @method updateUriCallback
   * @summary Update the url with query params if needed (ie add viewId, page etc)
   */
  updateUriCallback = (prop, value) => {
    const { updateUri, location, pathname } = this.props;
    const query = qs.parse(location.search, {
      ignoreQueryPrefix: true,
    });

    updateUri(pathname, query, prop, value);
  };

  /**
   * @method handleUpdateParentSelectedIds
   * @summary ToDo: Describe the method.
   */
  handleUpdateParentSelectedIds = (childSelection) => {
    this.masterDocumentList.updateQuickActions(childSelection);
  };

  render() {
    console.log('RENDER');
    const {
      windowId,
      query,
      modal,
      rawModal,
      overlay,
      processStatus,
      includedView,
    } = this.props;
    let refRowIds = [];

    if (query && query.refRowIds) {
      try {
        refRowIds = JSON.parse(query.refRowIds);
      } catch (e) {
        refRowIds = [];
      }
    }

    return (
      <Container
        entity="documentView"
        windowType={windowId}
        query={query}
        masterDocumentList={this.masterDocumentList}
      >
        <Overlay data={overlay.data} showOverlay={overlay.visible} />

        <div
          className={classnames('document-lists-wrapper', {
            'modal-overlay': rawModal.visible,
          })}
        >
          <DocumentList
            ref={(element) => {
              this.masterDocumentList = element ? element : null;
            }}
            type="grid"
            updateUri={this.updateUriCallback}
            windowType={windowId}
            refRowIds={refRowIds}
            includedView={includedView}
            inBackground={rawModal.visible}
            inModal={modal.visible}
            fetchQuickActionsOnInit
            processStatus={processStatus}
            disablePaginationShortcuts={modal.visible || rawModal.visible}
          />

          {includedView &&
            includedView.windowType &&
            includedView.viewId &&
            !rawModal.visible &&
            !modal.visible && (
              <DocumentList
                type="includedView"
                windowType={includedView.windowType}
                defaultViewId={includedView.viewId}
                parentWindowType={windowId}
                parentDefaultViewId={query.viewId}
                updateParentSelectedIds={this.handleUpdateParentSelectedIds}
                viewProfileId={includedView.viewProfileId}
                fetchQuickActionsOnInit
                processStatus={processStatus}
                isIncluded
                inBackground={false}
                inModal={false}
              />
            )}
        </div>
      </Container>
    );
  }
}

/**
 * @typedef {object} Props Component props
 * @prop {array} breadcrumb
 * @prop {func} dispatch
 * @prop {object} includedView
 * @prop {string} indicator
 * @prop {*} latestNewDocument
 * @prop {object} modal
 * @prop {object} overlay
 * @prop {string} pathname
 * @prop {object} pluginModal
 * @prop {string} processStatus
 * @prop {object} query - routing query
 * @prop {object} rawModal
 * @prop {object} windowType
 */
DocList.propTypes = {
  includedView: PropTypes.object.isRequired,
  latestNewDocument: PropTypes.any,
  modal: PropTypes.object.isRequired,
  overlay: PropTypes.object,
  processStatus: PropTypes.string.isRequired,
  query: PropTypes.object.isRequired,
  location: PropTypes.object.isRequired,
  pathname: PropTypes.string.isRequired,
  rawModal: PropTypes.object.isRequired,
  windowId: PropTypes.string,
  getWindowBreadcrumb: PropTypes.func.isRequired,
  selectTableItems: PropTypes.func.isRequired,
  setLatestNewDocument: PropTypes.func.isRequired,
  updateUri: PropTypes.func.isRequired,
};

/**
 * @method mapStateToProps
 * @summary ToDo: Describe the method.
 * @param {object} state
 */
const mapStateToProps = (state) => {
  return {
    modal: state.windowHandler.modal,
    rawModal: state.windowHandler.rawModal,
    overlay: state.windowHandler.overlay,
    latestNewDocument: state.windowHandler.latestNewDocument,
    includedView: state.listHandler.includedView,
    processStatus: state.appHandler.processStatus,
    pathname: state.router.location.pathname,
  };
};

export default withRouter(
  connect(
    mapStateToProps,
    {
      getWindowBreadcrumb,
      selectTableItems,
      setLatestNewDocument,
      updateUri,
    }
  )(DocList)
);
