import QtQuick 2.5
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
        onUploadImageClicked: {
            console.log("Upload image button clicked")
            // create account visible: false
            // set user image
            // create account visible true
        }
    }

    HomeScreen{
        id: home_page
        height: parent.height
        width: parent.width
        visible: false

        onMenuClicked: {
            console.log("menu clicked")
        }

        onRefreshedClicked: {
            console.log("refreshed clicked")
        }

        onSharedClicked: {
            console.log("shared clicked")
        }

        onUploadClicked: {
            console.log("upload clicked")
        }

        onStarClicked: {
            console.log("star clicked")
        }

        onCommentClicked: {
            console.log("comment clicked")
        }

        onRateClicked: {
            console.log("rate clicked")
        }
        onLogoutClicked: {
            console.log("logout clicked")
            home_page.visible = false
            login_page.visible = true
        }

        onProfileClicked: {
            console.log("profile clicked")
        }
    }
}
