import React, { Component } from 'react';
import PropTypes from 'prop-types';
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
      <GradientTextNative title={`Tjenare mannen`} />
    )
  }
}

GradientText.propTypes = {
  configuration: PropTypes.object,
  title: PropTypes.string
}

const GradientTextNative = requireNativeComponent('GradientText', GradientText);

export default GradientText;
