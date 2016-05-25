import QtQuick 2.0

Rectangle{
    id: root
    signal theme
    signal infoClicked
    signal picsClicked
    signal friendsClicked
    signal favoritesClicked

    onTheme: color = CurrentTheme.getThemeBackColor()

    Component.onCompleted:
    {
        theme()
        themeSet.connect(theme)
    }

    Rectangle{
        id: userRect
        // user name text
        // picture from sql
        // back arrow
    }
    Rectangle{
        Row{
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
                   themeSet.connect(theme)
               }
            }
            Rectangle{
                id: pics
                height: parent.height
                width: parent.width / 4
                color: "transparent"
                border.width: 1

                Text{
                    id: picsText
                    text: "I"
                    font.pointSize: parent.height/2
                    anchors.centerIn: parent
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: picsClicked()
                }

                signal theme
                onTheme: {
                    color = CurrentTheme.getThemeBackColor()
                    picsText.color = CurrentTheme.getThemeForeColor()
                }

                Component.onCompleted:
                {
                    theme()
                    themeSet.connect(theme)
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
                    text: "I"
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
                    themeSet.connect(theme)
                }
            }
            Rectangle{
                id: favorites
                height: parent.height
                width: parent.width / 4
                color: "transparent"
                border.width: 1

                Text{
                    id: favoritesText
                    text: "I"
                    font.pointSize: parent.height/2
                    anchors.centerIn: parent
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: favoritesClicked()
                }

                signal theme
                onTheme: {
                    color = CurrentTheme.getThemeBackColor()
                    favoritesText.color = CurrentTheme.getThemeForeColor()
                }

                Component.onCompleted:
                {
                    theme()
                    themeSet.connect(theme)
                }
            }
        }
    }
    Rectangle{
        id: extra
        signal info
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
        }
    }
}
