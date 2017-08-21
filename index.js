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
      <Text>Tjenare mannen!</Text>
    )
  }
}

// GradientText.propTypes = {
//   configuration: PropTypes.object,
//   title: PropTypes.string
// }

// const GradientTextLabel = requireNativeComponent('GradientText', GradientText);

export default {
  GradientText
};
