import React, { Component, PropTypes } from 'react';

import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  requireNativeComponent
} from 'react-native';

class GradientText extends Component {
  render() {
    const title = this.props.children || this.props.title
    return (
      <GradientTextLabel
        style={this.props.style}
        configuration={this.props.config}
        title={title || `No title`} />
    )
  }
}

GradientText.propTypes = {
  configuration: PropTypes.object,
  title: PropTypes.string
}

const GradientTextLabel = requireNativeComponent('GradientText', GradientText);

export default GradientText;
