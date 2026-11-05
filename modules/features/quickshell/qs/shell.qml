import Quickshell
import QtQuick
import QtQuick.Layouts

Scope {
	PanelWindow {
		anchors {
			top: true
			left: true
			right: true
		}

		implicitHeight: 42
		color: "transparent"

		ClockWidget {
			implicitHeight: 36
			implicitWidth: 72
		}

		Rectangle {
			anchors.top: parent.top
			anchors.right: parent.right
			anchors.verticalCenter: parent.verticalCenter

			anchors.topMargin: 8
			anchors.rightMargin: battery.implicitWidth / 2

			implicitHeight: battery.implicitHeight + 24
			implicitWidth: battery.implicitWidth + 24

			radius: 15

			color: "#2d2d2d"

			BatteryWidget {
				id: battery
				anchors.centerIn: parent
			}
		}

	}
}
