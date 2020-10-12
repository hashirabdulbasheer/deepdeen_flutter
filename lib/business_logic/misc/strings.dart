class DeepDeenStrings {
  static String getString(String key) => englishStrings[key];
  static String getErrorString(String key) => errorStrings[key];

  static final Map<String, String> errorStrings = {
    "error_invalid_email": "Enter a valid email address",
    "error_invalid_password": "Enter a valid password",
  };

  static final Map<String, String> englishStrings = {
    "app_name": "DeepDeen",
    "start_free_trial": "START FREE TRIAL",
    "or": "or",
    "sign_in": "Sign In",
    "home_screen_message":
        "Thousands of hours of intellectually stimulating and spiritually uplifting content by leading scholars and thinkers like Dr Mohammad Akram Nadwi is brought to you by Cambridge Islamic College for a small monthly subscription to help the College run and develop its full-time Advanced Alimiyyah and Arabic programmes.",
    "login_popup_title": "Sign in",
    "login_email_label": "Email address",
    "login_email_hint": "Enter your email address",
    "login_email_button_text": "Next",
    "login_help_text": "Need help?",
    "login_password_label": "Password",
    "login_password_hint": "Enter your password",
    "login_password_button_text": "Submit"
  };
}
