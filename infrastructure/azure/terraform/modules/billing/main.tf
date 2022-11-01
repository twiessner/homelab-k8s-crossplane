
data "azurerm_client_config" "current" {}

locals {
  contact_emails = [
    "phil@containeirze.de",
    "tom.wiessner@hotmail.com"
  ]
}

resource "azurerm_consumption_budget_subscription" "default" {
  name            = join("-", ["consumption", "default"])
  subscription_id = data.azurerm_client_config.current.subscription_id

  amount     = 25
  time_grain = "Monthly"

  time_period {
    start_date = "2022-11-01T00:00:00Z"
  }

  notification {
    enabled        = true
    threshold      = 50.0
    operator       = "EqualTo"
    threshold_type = "Forecasted"
    contact_emails = local.contact_emails
  }

  notification {
    enabled        = true
    threshold      = 100.0
    operator       = "EqualTo"
    threshold_type = "Actual"
    contact_emails = local.contact_emails
  }
}