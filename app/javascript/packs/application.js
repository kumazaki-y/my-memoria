// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import { csrfToken } from '@rails/ujs';
import Rails from "@rails/ujs";
import axios from 'axios';
import $ from 'jquery';
import 'bootstrap';
import Popper from 'popper.js'
window.jQuery = $;
window.$ = $;
window.Popper = Popper
import '../stylesheets/application'


Rails.start();

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken();

import './article'; 
import './profile'; 
import './like'; 
import './comment'; 
import './relationship'; 

$(function(){
    $('.menu-button').on('click',function(){
      $('.dropdown-menu').toggle();
    });
  });
  




