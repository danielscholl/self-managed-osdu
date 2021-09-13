/*
.Synopsis
   Terraform Output Values
.DESCRIPTION
   This file holds the output values.
*/

output "name" {
  value       = var.aad_client_id != "" ? null : azuread_application.main[0].name
  description = "The display name of the application."
}

output "id" {
  value       = var.aad_client_id != "" ? null : azuread_application.main[0].application_id
  description = "The ID of the application."
}

output "object_id" {
  value       = var.aad_client_id != "" ? null : azuread_application.main[0].object_id
  description = "The object ID of the application."
}

output "roles" {
  value = var.aad_client_id != "" ? null : {
    for r in azuread_application.main[0].app_role :
    r.display_name => {
      id          = r.id
      name        = r.display_name
      value       = r.value
      description = r.description
      enabled     = r.is_enabled
    }
  }
  description = "The application roles."
}

output "password" {
  value       = var.aad_client_id != "" ? null : azuread_application_password.main.0.value
  sensitive   = true
  description = "The password for the application."
}
