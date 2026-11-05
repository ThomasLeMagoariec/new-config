import Quickshell
import QtQuick


Rectangle {
	id: clock

	anchors.top: parent.top
	anchors.topMargin: 6
	anchors.horizontalCenter: parent.horizontalCenter

	implicitHeight: parent.implicitHeight + 20
	implicitWidth: parent.implicitWidth + 46

	radius: 15
	color: "#2d2d2d"

	Text {
		id: clocktext
		SystemClock {
			id: sysclock
			precision: SystemClock.Minutes
		}

		anchors.centerIn: parent

		text: Qt.formatDateTime(sysclock.date, "HH:mm")
		color: "white"
		font.pixelSize: 16
	}

	MouseArea {
		hoverEnabled: true
		anchors.fill: parent
	}
}
