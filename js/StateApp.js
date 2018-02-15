'use strict';

import React from 'react';
import ReactNative, {
  StyleSheet,
  Text,
  View,
} from 'react-native';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'green',
  },
  welcome: {
    fontSize: 20,
    color: 'white',
  },
});

class StateApp extends React.Component {
  render() {
    return (
      <View style={styles.container}>
      <Text style={styles.welcome}>We're live from React Native!!!</Text>
      </View>
      )
    }
  }

  module.exports = StateApp;
