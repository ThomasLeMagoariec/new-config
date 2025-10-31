import QtQuick 6.6
import Quickshell 1.0
import Quickshell.Widgets 1.0
import Quickshell.Panels 1.0
import Quickshell.Controls 1.0

Panel {
    id: macosBar
    position: "top"
    height: 28
    anchors.fill: parent
    background: Rectangle {
        color: "#F5F5F7CC"     // translucent light gray
        radius: 0
        layer.enabled: true
        layer.blur: 20
    }

    Row {
        id: leftSection
        spacing: 8
        anchors.left: parent.left
        anchors.leftMargin: 12
        anchors.verticalCenter: parent.verticalCenter

        Text {
            text: ""
            font.family: "SF Pro Display"
            font.bold: true
            font.pixelSize: 16
            color: "#000000DD"
            verticalAlignment: Text.AlignVCenter
        }

        MenuButton {
            text: "Finder"
            menu: Menu {
                MenuItem { text: "About This Mac"; onTriggered: shell.exec("gnome-control-center info-overview") }
                MenuSeparator { }
                MenuItem { text: "System Settings"; onTriggered: shell.exec("gnome-control-center") }
                MenuItem { text: "Sleep"; onTriggered: shell.exec("systemctl suspend") }
                MenuItem { text: "Restart"; onTriggered: shell.exec("systemctl reboot") }
                MenuItem { text: "Shut Down"; onTriggered: shell.exec("systemctl poweroff") }
            }
        }
    }

    Text {
        id: centerClock
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        font.family: "SF Pro Display"
        font.pixelSize: 13
        color: "#000000DD"
        text: Qt.formatDateTime(new Date(), "ddd MMM d  hh:mm AP")

        Timer {
            interval: 30000
            running: true
            repeat: true
            onTriggered: centerClock.text = Qt.formatDateTime(new Date(), "ddd MMM d  hh:mm AP")
        }
    }

    Row {
        id: rightSection
        spacing: 12
        anchors.right: parent.right
        anchors.rightMargin: 12
        anchors.verticalCenter: parent.verticalCenter

        Text {
            text: "🔊"
            font.pixelSize: 14
            MouseArea {
                anchors.fill: parent
                onClicked: shell.exec("pactl set-sink-mute @DEFAULT_SINK@ toggle")
            }
        }

        Text { text: "📶"; font.pixelSize: 14; }
        Text {
            text: "🔋"
            font.pixelSize: 14
            MouseArea {
                anchors.fill: parent
                onClicked: shell.exec("gnome-power-statistics")
            }
        }
    }
}
