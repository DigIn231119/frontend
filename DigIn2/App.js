import React, { Component } from 'react';
import { Button, StyleSheet, View, Text, TextInput } from 'react-native';

export default class ButtonBasics extends Component {
  _onPressButton() {
    alert('You tapped the button!')
  }

  render() {
    return (
      <View>
        <View style = {{padding: 10}}>
          <TextInput 
          style = {{height: 40}}
          placeholder='Email or Username'
          // value={this.state.text}
          />
        </View>

        <View style = {{padding: 10}}>
          <TextInput 
          style = {{height: 40}}
          placeholder='Password'
          // value={this.state.text}
          />
        </View>

        <View style={styles.buttonContainer}>
          <Button
            onPress={this._onPressButton}
            title='press me'
            color='#841584' //TODO: coolour scheme
          />
        </View>
      </View>
    );
  }
}

const styles = StyleSheet.create({ //TODO: center button and text fields
  container: {
    flex: 1,
    justifyContent: 'center',
  },
  buttonContainer: {
    margin: 20
  },
  alternativeLayoutButtonContainer: {
    margin:20,
    flexDirection: 'row',
    justifyContent: 'space-between'
  }
});