import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import "./modules/"


ShellRoot{
	id: root
	property color text: "#ffffff"
	property color back: Qt.rgba( 0, 0, 0, 0.3)
	property color border: Qt.rgba( 255, 255, 255, 0.3)
	property var fontFamily: "Noto Sans"
	property int fontSize: 15
	property int barH: 33
	LazyLoader { active: true; component: Left {} }
	LazyLoader { active: true; component: Center {} }
	LazyLoader { active: true; component: Right {} }
	LazyLoader { active: true; component: Wallpaper {} }
}
