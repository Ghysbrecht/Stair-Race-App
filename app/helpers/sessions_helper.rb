module SessionsHelper
    # Logs in the given admin.
    def log_in(admin)
      session[:admin_id] = admin.id
    end
end
