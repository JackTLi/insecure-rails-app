Rails.application.config.session_store :cookie_store,
  key: '_insecure_rails_app_session', httponly: false
