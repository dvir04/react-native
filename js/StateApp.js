'use strict';

import React from 'react';
import ReactNative, {
  StyleSheet,
  Text,
  View,
  Switch,
  NativeModules,
  NativeEventEmitter
} from 'react-native';

const { StateManager } = NativeModules;

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
  switch: {
    top: 40
  },
});

class StateApp extends React.Component {

  constructor(props) {
    super(props);
    this._subscription = null;
    this.state = {
      value: props.state
    }
  }

  componentDidMount() {
    const StateManagerEvent = new NativeEventEmitter(StateManager);
    this._subscription = StateManagerEvent.addListener('StateManagerEvent', (info) => {
      console.log(info.state);
      this.setState({
        value: info.state
      })
    }
    );
  }

  componentWillUnmount() {
    this._subscription.remove();
  }

  stateValueChanged = (value) => {
    StateManager.stateValueChanged(value);
    this.setState({
      value: value
    })
  }

  render() {
    return (
      <View style={styles.container}>
      <Text style={styles.welcome}>React Native View</Text>
      <Switch style={styles.switch}
      value={ this.state.value }
      onValueChange={(value) => this.stateValueChanged(value)}
      />
      </View>
      )
    }
  }

  module.exports = StateApp;
