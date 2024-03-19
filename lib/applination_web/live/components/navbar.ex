defmodule ApplinationWeb.Components.Navbar do
  use ApplinationWeb, :live_component

  alias ApplinationWeb.User

  def render(assigns) do
    ~H"""
    <header class="fixed w-full px-4 bg-white sm:px-6 lg:px-8 dark:bg-zinc-800">
      <div class="flex items-center justify-between py-3 text-sm border-b border-zinc-200">
        <div class="flex items-center justify-center gap-2">
          <.link navigate={~p"/"}>
            <div class="flex gap-1">
              <.logo />
              <span class="px-2 py-1 text-xl font-bold uppercase rounded-full text-brand">
                Applination
              </span>
            </div>
          </.link>
          <div phx-hook="ThemeSelector" id="theme-selector" class="h-5">
            <.icon
              name="hero-moon-solid"
              class="w-5 text-purple-600 cursor-pointer dark:hidden"
              id="dark-theme-selector"
            />
            <.icon
              name="hero-sun-solid"
              class="hidden w-5 text-yellow-500 cursor-pointer dark:block"
              id="light-theme-selector"
            />
          </div>
        </div>
        <div class="flex items-center">
          <ul id="nav-links" class="absolute left-0 flex flex-col items-center justify-end w-full gap-4 px-4 bg-white lg:static lg:flex-row dark:bg-zinc-800 top-[-100%] sm:px-6 lg:px-8">
            <%= if @current_user do %>
              <li>
                <.link
                  navigate={~p"/users/settings"}
                  class={apply_active_class(@socket.view, User.SettingsLive)}
                >
                  <%= @current_user.username %>
                </.link>
              </li>
              <li>
                <.link
                  href={~p"/users/log_out"}
                  method="delete"
                  class="font-bold hover:text-brand dark:text-white"
                >
                  Log out
                </.link>
              </li>
            <% else %>
              <li>
                <.link
                  navigate={~p"/users/register"}
                  class={apply_active_class(@socket.view, User.RegistrationLive)}
                >
                  Register
                </.link>
              </li>
              <li>
                <.link
                  navigate={~p"/users/log_in"}
                  class={apply_active_class(@socket.view, User.LoginLive)}
                >
                  Log in
                </.link>
              </li>
            <% end %>
          </ul>
          <div phx-hook="MenuToggler" id="menu-toggler" class="lg:hidden">
            <.icon name="hero-bars-3" class="w-10 h-10 cursor-pointer text-brand"/>
          </div>
        </div>
      </div>
    </header>
    """
  end

  def apply_active_class(current_view, required_view) do
    default_classes = "text-md leading-6 font-bold hover:text-brand transition"

    active_classes =
      if current_view == required_view do
        "text-brand"
      else
        "text-zinc-900 dark:text-white"
      end

    default_classes <> " " <> active_classes
  end
end
