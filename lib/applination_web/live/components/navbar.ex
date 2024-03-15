defmodule ApplinationWeb.Components.Navbar do
  use ApplinationWeb, :live_component

  def render(assigns) do
    ~H"""
    <header class="px-4 sm:px-6 lg:px-8">
      <div class="flex items-center justify-between py-3 text-sm border-b border-zinc-100">
        <div class="flex items-center gap-4">
          <.link navigate={~p"/"}>
            Applination
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
                  class="text-[0.8125rem] leading-6 text-zinc-900 font-semibold hover:text-zinc-700"
                >
                  Settings
                </.link>
              </li>
              <li>
                <.link
                  href={~p"/users/log_out"}
                  method="delete"
                  class="text-[0.8125rem] leading-6 text-zinc-900 font-semibold hover:text-zinc-700"
                >
                  Log out
                </.link>
              </li>
            <% else %>
              <li>
                <.link
                  navigate={~p"/users/register"}
                  class="text-[0.8125rem] leading-6 text-zinc-900 font-semibold hover:text-zinc-700"
                >
                  Register
                </.link>
              </li>
              <li>
                <.link
                  navigate={~p"/users/log_in"}
                  class="text-[0.8125rem] leading-6 text-zinc-900 font-semibold hover:text-zinc-700"
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
end
