import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Rectangle
{
    signal loginClicked
    signal createAccountClicked

    id: login_rect
    color: "#dadddc"

    Text{
        id: logo_txt
        text: "RussT"
        font.pointSize: 28
        font.bold: true
        color: "lightseagreen"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Image{
        source: "/../RussT/img/gear.png"
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height * .15
        height: parent.height * .4
        width: height
    }

    // Username box
    Rectangle
    {
        id: username
        height: 30
        width: parent.width * .9
        color: "white"
        x: parent.width * .05
        y: parent.height * .65

        TextField{
            id: user_txt
            placeholderText: "Username"
            anchors.fill: parent
        }


        // password box
        Rectangle{
            id: password
            height: parent.height
            width: parent.width
            color: parent.color
            y: parent.height * 1.25

            TextField{
                id: pass_txt
                placeholderText: "Password"
                anchors.fill: parent
            }
        }
    }

    // Create account button
    Rectangle
    {
        id: create_account
        height: parent.height / (32/3)
        width: parent.width * .4375
        anchors.right: parent.right
        anchors.rightMargin: parent.width * .05
        y: username.y + (username.height * 2.75)
        color: "grey"

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: " Create\nAccount"
            font.pointSize: parent.height / (60/14)
            color: "black"
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                createAccountClicked()
            }
        }
    }

    // login button, transitions to next screen
    Rectangle
    {
        height: parent.height / (32/3)
        width: parent.width * .4375
        color: "grey"
        anchors.left: parent.left
        anchors.leftMargin: parent.width * .05
        y: username.y + (username.height * 2.75)

        Text{
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Login"
            font.pointSize: parent.height / (60/26)
            color: "black"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                loginClicked()
            }
        }
    }
}
