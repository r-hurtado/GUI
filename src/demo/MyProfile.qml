import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle{
    id: root
    signal theme
    signal infoClicked
    signal picsClicked
    signal friendsClicked
    signal favoritesClicked

    signal backClicked

    onTheme: color = CurrentTheme.getThemeBackColor()

    Component.onCompleted:
    {
        theme()
        //themeSet.connect(theme)
    }

    Rectangle{
        id: userRect
        height: parent.height / 3
        width: parent.width
        color: "skyblue"
        // user name text
        Rectangle{
            id: nameRect
            height: parent.height / 6
            width: parent.width / 2
            anchors.bottom: userRect.bottom
            Text{
                text: "Username"
                font.pointSize: parent.height/2.5
                anchors.verticalCenter: nameRect.verticalCenter
                anchors.left: nameRect.left
                anchors.leftMargin: contentHeight/2
            }
            color: "white" // change to theme
        }
        // picture from sql
        // back arrow
        Rectangle
        {
            id: backRect
            height: parent.height / 3
            width: height
            color: "transparent"
            Image {
                id: back
                source: "../All images/left-arrow.png"
                anchors.fill: parent
            }
            MouseArea{
                onClicked: backClicked()
                anchors.fill: backRect
            }
        }
        Rectangle{
            id: userPicture
            color: "transparent"
            anchors.centerIn: parent
            height: 100
            width: 100
            Image{source: "../Theme 1/user.png"; anchors.fill: parent}
        }
    }

    Rectangle{
        id: rowRect
        height: parent.height / 6
        width: parent.width
        anchors.top: userRect.bottom

        Row{
            anchors.fill: parent

            Rectangle{
                id: info
                height: parent.height
                width: parent.width / 4
                color: "transparent"
                border.width: 1

                Text{
                    id: infoText
                    text: "I"
                    font.pointSize: parent.height/2
                    anchors.centerIn: parent
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: infoClicked()
                }

                signal theme
                onTheme: {
                    color = CurrentTheme.getThemeBackColor()
                    infoText.color = CurrentTheme.getThemeForeColor()
                }

                Component.onCompleted:
                {
                    theme()
                    //themeSet.connect(theme)
                }
            }
            Rectangle{
                id: pics
                height: parent.height
                width: parent.width / 4
                color: "transparent"
                border.width: 1

                Image{
                    id: picsText
                    source: "../../All images/gallery.png"

                    height: parent.height * .9
                    width: height
                    anchors.centerIn: parent
                }

                ColorOverlay {
                    id: picsOverlay
                    anchors.fill: picsText
                    source: picsText
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: picsClicked()
                }

                signal theme
                onTheme: {
                    color = CurrentTheme.getThemeBackColor()
                    picsOverlay.color = CurrentTheme.getThemeForeColor()
                }

                Component.onCompleted:
                {
                    theme()
                    //themeSet.connect(theme)
                }
            }
            Rectangle{
                id: friends
                height: parent.height
                width: parent.width / 4
                color: "transparent"
                border.width: 1

                Text{
                    id: friendsText
                    text: "BFF"
                    font.pointSize: parent.height/2
                    anchors.centerIn: parent
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: friendsClicked()
                }

                signal theme
                onTheme: {
                    color = CurrentTheme.getThemeBackColor()
                    friendsText.color = CurrentTheme.getThemeForeColor()
                }

                Component.onCompleted:
                {
                    theme()
                    //themeSet.connect(theme)
                }
            }
            Rectangle{
                id: favorites
                height: parent.height
                width: parent.width / 4
                color: "transparent"
                border.width: 1

                Image{
                    id: favText
                    source: "../../All images/heart.png"

                    height: parent.height * .9
                    width: height
                    anchors.centerIn: parent
                }

                ColorOverlay {
                    id: favOverlay
                    anchors.fill: favText
                    source: favText
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: picsClicked()
                }

                signal theme
                onTheme: {
                    color = CurrentTheme.getThemeBackColor()
                    favOverlay.color = CurrentTheme.getThemeForeColor()
                }

                Component.onCompleted:
                {
                    theme()
                    //themeSet.connect(theme)
                }
            }
        }
    }
    Rectangle{
        id: extra
        height: parent.height / 2
        width: parent.width
        anchors.top: rowRect.bottom
        color: "violet"
        Text{
            text: "Information about user"
            font.pointSize: 14
        }

        /*signal info
        signal pics
        signal friends
        signal favorites

        onInfo: console.log("info clicked")
        onPics: console.log("pics clicked")
        onFriends: console.log("friends clicked")
        onFavorites: console.log("favorites clicked")
        Component.onCompleted:
        {
            infoClicked.connect(info)
            picsClicked.connect(pics)
            friendsClicked.connect(friends)
            favoritesClicked.connect(favorites)
        }*/
    }
}
