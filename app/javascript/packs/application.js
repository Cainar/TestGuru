// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'utilities/input_compare'
import 'utilities/sorting'
//import I18n from 'i18n-js/index.js.erb'
import 'utilities/form_inline'
import 'utilities/progress_bar'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

window.I18n = I18n
