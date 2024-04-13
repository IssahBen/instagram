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

function toggleButton() {
    // Get a reference to the button element
    const button = document.getElementById('search-contacts');

    // Check if the button is currently active (if it has the 'active' class)
    button.click()
}

// Execute the toggleButton() function on every turbo:load event
document.addEventListener('turbo:load', function () {
    toggleButton();
});