import React, {Component} from 'react';
import {
    View, 
    Text,
    StyleSheet
    } from 'react-native';

class Home extends Component {
    render(){
        return (
            <View style={StyleSheet.container}>
                <Text>Homepage</Text> 
            </View>
        );
    }
}

export default Home

const styles = StyleSheet.create({
    container:{
        flex: 1, alignItems: 'center', justifyContent: 'center'
    }
})