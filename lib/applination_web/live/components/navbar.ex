defmodule ApplinationWeb.Components.Navbar do
  use ApplinationWeb, :live_component

  alias ApplinationWeb.User

  def render(assigns) do
    ~H"""
    <header class="px-4 sm:px-6 lg:px-8">
      <div class="flex items-center justify-between py-3 text-sm border-b border-zinc-100">
        <div class="flex items-center gap-4">
          <.link navigate={~p"/"} class="">
            <div class="flex gap-1">
              <.logo />
              <span class="px-2 py-1 text-xl font-bold uppercase rounded-full text-brand">
                Applination
              </span>
            </div>
          </.link>
        </div>
        <div class="flex items-center gap-4 font-semibold leading-6 text-zinc-900">
          <ul class="relative z-10 flex items-center justify-end gap-4 px-4 sm:px-6 lg:px-8">
            <%= if @current_user do %>
              <li class="text-[0.8125rem] leading-6 text-zinc-900">
                <%= @current_user.email %>
              </li>
              <li>
                <.link
                  navigate={~p"/users/settings"}
                  class={apply_active_class(@socket.view, User.SettingsLive)}
                >
                  Settings
                </.link>
              </li>
              <li>
                <.link href={~p"/users/log_out"} method="delete" class="hover:text-brand">
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
        "text-zinc-900"
      end

    default_classes <> " " <> active_classes
  end
end
