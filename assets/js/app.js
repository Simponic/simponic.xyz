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
import "flatpickr/dist/themes/dark.css"
import {validDate, flatpickrOptions, submitTimes} from "./date_picker_timezone_control"
window.validDate = validDate;
window.flatpickrOptions = flatpickrOptions;
window.flatpickr = flatpickr;
window.updateTimes = submitTimes;

import DOMPurify from "dompurify"
window.DOMPurify = DOMPurify

import hljs from 'highlight.js/lib/core';
import "highlight.js/styles/dark.css"
import javascript from 'highlight.js/lib/languages/javascript';
import css from 'highlight.js/lib/languages/css';
import nginx from 'highlight.js/lib/languages/nginx';
import dockerfile from 'highlight.js/lib/languages/dockerfile';
import bash from 'highlight.js/lib/languages/bash';
import elixir from 'highlight.js/lib/languages/elixir';
import pgsql from 'highlight.js/lib/languages/pgsql';
hljs.registerLanguage('javascript', javascript);
hljs.registerLanguage('css', css);
hljs.registerLanguage('nginx', nginx);
hljs.registerLanguage('dockerfile', dockerfile);
hljs.registerLanguage('bash', bash);
hljs.registerLanguage('elixir', elixir);
hljs.registerLanguage('pgsql', pgsql);
hljs.highlightAll();

import selectize from "selectize"
import "selectize/dist/css/selectize.css"
$(() => {
  $(".selectize").selectize({
    create: true,
    sortField: "text",
  });
})

import moment from "moment"
window.moment = moment

