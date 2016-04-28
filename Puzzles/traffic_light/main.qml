import QtQuick 2.6
import QtQuick.Controls 1.5
import Qt.labs.settings 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Traffic Light")

    //property int index: 0

    Rectangle
    {
        id: big_wrapper
        anchors.fill: parent

        Settings{
            id: settings
            property alias g: rect_green_light.color
            property alias y: rect_yellow_light.color
            property alias r: rect_red_light.color
            property int index
        }

        Timer{
            id: timer
            interval: 2000
            running: true
            repeat: true

            onTriggered: {
                TrafficLight.toggle_light(settings.index++ % 3)
                console.log(settings.index)
                rect_green_light.color = TrafficLight.get_light_on(0) ? "green" : "black"
                rect_yellow_light.color = TrafficLight.get_light_on(1) ? "yellow" : "black"
                rect_red_light.color = TrafficLight.get_light_on(2) ? "red" : "black"
            }
        }

        Rectangle
        {
            id: rect_traffic_light_head
            anchors.horizontalCenter: big_wrapper.horizontalCenter
            anchors.verticalCenter: big_wrapper.verticalCenter

            height: parent.height * .9;
            width: parent.width/3;
            border.color: "brown"

            //transform: Scale{xScale: .3; yScale: .3}

            Rectangle
            {
                id: rect_red_light
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                height: 100;
                width: 100;
                radius: width/2;
                border.width: 10
                border.color: "black"
                color: "black"

            }

            Rectangle
            {
                id: rect_yellow_light
                anchors.top: rect_red_light.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                height: 100;
                width: 100;
                radius: width/2;
                border.width: 10
                border.color: "black"
                color: "black"
            }

            Rectangle
            {
                id: rect_green_light
                anchors.top: rect_yellow_light.bottom
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                height: 100;
                width: 100;
                radius: width/2;
                border.color: "black"
                border.width: 10
                color: "black"
            }
        }

    }
}
