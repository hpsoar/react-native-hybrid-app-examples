'use strict';

var React = require('react-native');

var {
    View,
    Text,
    NavigatorIOS,
    NativeModules,
} = React;

var SimpleList = require('./SimpleList');
var SimpleView = require('./SimpleView');
var ModalWithNavigatorCoordinator = NativeModules.ModalWithNavigatorCoordinator;
var cyBridge = NativeModules.cyRCTBridge;

var data = [
    'One',
    'Two',
    'Three',
]

class ModalWithNavigator extends React.Component{
    _handleButton() {
      cyBridge.closeModalVC();
//      cyRCTPipe.popVC();
    }

    _handleRowPress() {
        this.refs.navigator.push({
            title: 'Simple View',
            component: SimpleView,
        });
    }

    render() {
        return (
            <NavigatorIOS
                ref="navigator"
                style={styles.container}
                initialRoute={{
                    title: 'Modal with Navigator',
                    component: SimpleList,
                    passProps: {
                        data: data,
                        rowPressed: this._handleRowPress.bind(this)
                    },
                    leftButtonTitle: 'Close',
                    onLeftButtonPress: this._handleButton.bind(this),
                    rightButtonTitle: 'OK',
                }}
            />
        );
    }
};

var styles = React.StyleSheet.create({
    container: {
        flex: 1,
    }
});

module.exports = ModalWithNavigator;
