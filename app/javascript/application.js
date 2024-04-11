// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "popper"

import "bootstrap"
import "filepond"
import "custom/custom"
import "filepond-plugin-image-preview"
import "filepond-plugin-file-validate-type"
import Rails from "@rails/ujs";

Rails.start();