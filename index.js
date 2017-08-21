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
    return (
      <GradientTextNative>
        Tjenare mannen!
      </GradientTextNative>
    )
  }
}

GradientText.propTypes = {
  configuration: PropTypes.object,
  title: PropTypes.string
}

const GradientTextNative = requireNativeComponent('GradientText', GradientText);

export default GradientText;
