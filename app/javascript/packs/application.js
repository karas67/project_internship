import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("../stylesheets/application.scss")
require("@popperjs/core")
require.context('../images', true)

import "bootstrap"
import 'bootstrap/js/dist/dropdown'
import 'bootstrap-icons/font/bootstrap-icons.css'


