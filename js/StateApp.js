'use strict';

import React from 'react';
import ReactNative, {
  StyleSheet,
  Text,
  View,
  NativeModules,
  TouchableOpacity
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
  button: {
    backgroundColor: '#ff8000',
    borderRadius: 4,
    padding:10
  },
  buttonText : {
    color : '#fff',
    textAlign:'center',
    fontWeight: 'bold'
  },
});

class StateApp extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      buttonText: 'First Example'
    }
  }

  buttonClick = () => {
        // NativeModules.ViewController.setState(this.state.switchState, (state) => {
        //     this.setState({state});
        // });
        StateManager.didPressButton(this.props.rootTag);
      }

      render() {
        return (
          <View style={styles.container}>
          <Text style={styles.welcome}>React Native View</Text>
          <TouchableOpacity>
          <View style={styles.button}>
          <Text style={styles.buttonText}
          onPress={() => { this.buttonClick()}}>{this.state.buttonText}</Text>
          </View>
          </TouchableOpacity>
          </View>
          )
        }
      }

      module.exports = StateApp;
