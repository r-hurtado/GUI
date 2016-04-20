import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Rectangle
{
    signal backClicked
    signal createAccountClicked

    id: create_account_rect
    height: 400
    width: 400
    color: "red"
    visible: true

    Text{
        //anchors.horizontalCenterOffset: 200
        text: "Create Account"
        font.pointSize: 24
        color: "white"
    }

    // Back button that takes user to login screen
    Rectangle {
        id: back_button
        height: 15
        width: 30
        color: "silver"

        Text{
            text: "Back"
            color: "black"
            font.pointSize: 8
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                backClicked()
            }
        }
    }

    // buttons for create username, email, password
    Rectangle{
        id: create_username
        height: 30
        width: 200
        color: "white"
        x: 40
        y: 60

        TextField{
            id: username_txt
            placeholderText: "Create username"
            anchors.fill: parent
        }


        Rectangle{
            id: create_email
            height: parent.height
            width: parent.width
            color: parent.color
            x: 0
            y: 40


            TextField{
                id: email_txt
                placeholderText: "Enter email"
                anchors.fill: parent
            }

            Rectangle{
                id: create_password
                height: parent.height
                width: parent.width
                color: parent.color
                x: 0
                y: 40

                TextField{
                    id: password_txt
                    placeholderText: "Create Password"
                    anchors.fill: parent
                }
            }
        }
    }
}
