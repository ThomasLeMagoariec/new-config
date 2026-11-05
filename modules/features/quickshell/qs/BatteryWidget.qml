import Quickshell
import QtQuick
import Quickshell.Services.UPower

Text {
	property var battery: UPower.displayDevice

	anchors.centerIn: parent
	text: Math.round(battery.percentage * 100) + " %"
	color: "white"
	font.pixelSize: 16
}
