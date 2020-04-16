// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
import socket from "./socket"
import leadForm from "./leadForm"

const channel = socket.channel("form:lead", {})
channel.join()
  .receive("ok", resp => { console.log("Joined form:lead successfully", resp) })
  .receive("error", resp => { console.log("Unable to join form:lead", resp) })

leadForm(channel)
