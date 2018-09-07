# We don't have a current_user method for audit, so we change to our
# current_admins_v1_admin, to register who make these changes in audit
Audited.current_user_method = :current_admins_v1_admin
