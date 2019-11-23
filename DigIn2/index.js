/**
 * @format
 */

import {AppRegistry} from 'react-native';
import App from './App';
import {name as appName} from './app.json';
import Home from './Home';
import { Navigation } from 'react-native-navigation';

Navigation.registerComponent('Home', () => Home)
Navigation.registerComponent('App', () => App)

Navigation.events().registerAppLaunchedListener(() => {
    Navigation.setRoot({
        root: {
            stack: {
                id:'AppStack',
                children: [
                    {
                        component: {
                            name: App
                        },
                    },
                ]
            }
        }
    })
})


AppRegistry.registerComponent(appName, () => App);
