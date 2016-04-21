import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Rectangle
{
    signal backClicked
    signal createAccountClicked
    signal uploadImageClicked

    id: create_account_rect
    height: 400
    width: 400
    color: "cadetblue"
    visible: true

    Text{
        id: create_txt
        text: "Create Account"
        font.pointSize: 28
        font.bold: true
        color: "white"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    // Back button that takes user to login screen
    Rectangle {
        id: back_button
        height: 20
        width: 40
        color: "silver"

        Text{
            text: "Back"
            color: "black"
            font.pointSize: 10
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                backClicked()
            }
        }
    }

    // circle for upload image
    Rectangle{
        height: parent.width / 4
        width: height
        radius: width/2
        color: "white"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: parent.height / -3.5
        border.color: "black"
        border.width: 2
    }

    // buttons for create username, email, password
    Rectangle{
        id: create_username
        height: 30
        width: parent.width * .9
        color: "white"
        x: parent.width * .05
        y: parent.height * .5

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

            y: parent.height * 1.5


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

                y: parent.height * 1.5

                TextField{
                    id: password_txt
                    placeholderText: "Create Password"
                    anchors.fill: parent
                }
            }
        }

    }
    // confirm create account button
    Rectangle{
        color: "silver"
        height: parent.height / (32/3)
        width: parent.width * .4375
        anchors.left: parent.left
        anchors.leftMargin: parent.width * .05
        y: create_username.y + (create_username.height * 4.5)

        Text{
            anchors.centerIn: parent
            text: "Upload Image"
            font.pointSize: parent.height / (60/14)
            color: "black"
        }

        MouseArea{
            anchors.fill: parent
            onClicked: uploadImageClicked()/*open front facing camera*/
        }
    }
    Rectangle{
        color: "silver"
        height: parent.height / (32/3)
        width: parent.width * .4375
        anchors.right: parent.right
        anchors.rightMargin: parent.width * .05
        y: create_username.y + (create_username.height * 4.5)

        Text{
            anchors.centerIn: parent
            text: "Create Account"
            font.pointSize: parent.height / (60/14)
            color: "black"
        }

        MouseArea{
            anchors.fill: parent
            onClicked: createAccountClicked()
        }


    }
}
