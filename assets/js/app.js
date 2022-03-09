import "../css/app.css"

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
import topbar from "../vendor/topbar"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {params: {_csrf_token: csrfToken}})

// Show progress bar on live navigation and form submits
topbar.config({barColors: {0: "#29d"}, shadowColor: "rgba(0, 0, 0, .3)"})
window.addEventListener("phx:page-loading-start", info => topbar.show())
window.addEventListener("phx:page-loading-stop", info => topbar.hide())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket

import $ from "jquery"
window.$ = $

import flatpickr from "flatpickr"
import {validDate, flatpickrOptions, submitTimes} from "./date_picker_timezone_control"
window.validDate = validDate;
window.flatpickrOptions = flatpickrOptions;
window.flatpickr = flatpickr;
window.updateTimes = submitTimes;

import DOMPurify from "dompurify"
window.DOMPurify = DOMPurify

import hljs from "highlight.js"
import "highlight.js/styles/dark.css"
hljs.highlightAll();