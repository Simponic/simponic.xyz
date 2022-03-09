defmodule SimponicxyzWeb.Router do
  use SimponicxyzWeb, :router

  import SimponicxyzWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {SimponicxyzWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
    plug NavigationHistory.Tracker, excluded_paths: ["/users/log_in", ~r(/admin.*)]
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SimponicxyzWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/projects", PageController, :works

    get "/contact", ContactController, :index
    get "/contact/clear", ContactController, :delete_form_session
    post "/contact", ContactController, :send

    resources "/motds", MotdController, only: [:index, :show]
    resources "/blogs", PostController, only: [:index, :show]
  end

  scope "/", SimponicxyzWeb do
    pipe_through [:browser, :require_authenticated_user]

    get "/punches/end-timer/:id", PunchController, :end_timer
    post "/punches/start-new", PunchController, :start_new
    get "/punches/delete-all", PunchController, :delete_all
    post "/punches/export", PunchController, :export

    resources "/punches", PunchController 
    resources "/comments", CommentController, except: [:index, :edit]
  end

  scope "/admin", SimponicxyzWeb do
    pipe_through [:browser, :require_admin_user]

    resources "/motds", MotdController, except: [:index, :show]
    resources "/blogs", PostController, except: [:index, :show]
    resources "/comments", CommentController, only: [:index, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", SimponicxyzWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: SimponicxyzWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  ## Authentication routes

  scope "/", SimponicxyzWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    get "/users/register", UserRegistrationController, :new
    post "/users/register", UserRegistrationController, :create
    get "/users/log_in", UserSessionController, :new
    post "/users/log_in", UserSessionController, :create
    get "/users/reset_password", UserResetPasswordController, :new
    post "/users/reset_password", UserResetPasswordController, :create
    get "/users/reset_password/:token", UserResetPasswordController, :edit
    put "/users/reset_password/:token", UserResetPasswordController, :update
  end

  scope "/", SimponicxyzWeb do
    pipe_through [:browser, :require_authenticated_user]

    get "/users/settings", UserSettingsController, :edit
    put "/users/settings", UserSettingsController, :update
    get "/users/settings/confirm_email/:token", UserSettingsController, :confirm_email
  end

  scope "/", SimponicxyzWeb do
    pipe_through [:browser]

    delete "/users/log_out", UserSessionController, :delete
    get "/users/confirm", UserConfirmationController, :new
    post "/users/confirm", UserConfirmationController, :create
    get "/users/confirm/:token", UserConfirmationController, :edit
    post "/users/confirm/:token", UserConfirmationController, :update
  end
end
