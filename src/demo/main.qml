import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {
    visible: true
    height: 640
    width: 480

    Login{
        id: login_page
        height: parent.height
        width: parent.width

        onLoginClicked: {
            visible = false
            home_page.visible = true
        }
        onCreateAccountClicked: {

            visible = false
            account_page.visible = true
        }
    }

    CreateAccount{
        id: account_page
        visible: false
        height: parent.height
        width: parent.width

        onBackClicked: {
            visible = false
            login_page.visible = true
        }
        onCreateAccountClicked: {
            visible = false
            home_page.visible = true
        }
    }

    HomeScreen{
        id: home_page
        height: parent.height
        width: parent.width
        visible: false
    }
}
