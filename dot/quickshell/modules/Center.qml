import QtQuick
import Quickshell.Io
import Quickshell
import Quickshell.Wayland

PanelWindow {
	id: center
	WlrLayershell.namespace: "qs-modulescenter"
	height: root.barH
	color: "transparent"
	anchors {
		top: true
	}
	width: cback.width
	Rectangle {
		id: cback
		color: root.back
		height: center.height
		border.color: root.border
		border.width: 1
		bottomLeftRadius: 20
		bottomRightRadius: 20
		y: -1
		width: works.implicitWidth + 20
		Row {
			id: works
			anchors.centerIn: parent
			spacing: 3
			property var workspaces: []
			Process {
				id: niriProc
				command: ["niri", "msg", "--json", "workspaces"]
				stdout: StdioCollector {
					onStreamFinished: {
						let ws = JSON.parse(text)
						ws.sort((a, b) => a.idx - b.idx)
						works.workspaces = ws
					}
				}
			}
			Timer {
				interval: 200
				running: true
				repeat: true
				triggeredOnStart: true
				onTriggered: niriProc.running = true
			}
			Repeater {
				model: works.workspaces
				Rectangle {
					width: 24
					height: 24
					radius: 20
					color: modelData.is_focused ? Qt.rgba(0, 0, 0, 0.1) : "transparent"
					Text {
						anchors.centerIn: parent
						text: modelData.idx
						color: modelData.is_focused ? "white" : Qt.rgba(255, 255, 255, 0.5)
					}
				}
			}
		}
	}
}
