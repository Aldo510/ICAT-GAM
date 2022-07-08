# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "bootstrap", to: "https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js", preload: true
pin "popper", to: "https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js", preload: true
pin "chartkick", to: "chartkick.js"
pin "Chart.bundle", to: "Chart.bundle.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "ploty", to: "https://cdn.plot.ly/plotly-2.9.0.min.js", preload: true

