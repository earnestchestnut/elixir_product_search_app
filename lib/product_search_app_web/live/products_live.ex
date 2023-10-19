defmodule ProductSearchAppWeb.CatalogLive do

  require Logger
  use ProductSearchAppWeb, :live_view

  def mount(_params, _session, socket) do
    Logger.info("LiveView mounted!")

    socket =
      socket
      |> assign(loading: false, products: [], search_error: nil, search_query: "", uri: %{}, show_results: false, toggle_text: "")

    {:ok, socket}
  end

  def handle_params(_unsigned_params, uri, socket) do
    uri = URI.parse(uri)
    socket = assign(socket, uri: uri, search_query: uri.query)

    handle_search_route_mount(uri)

    {:noreply, socket}
  end

  @spec handle_search_route_mount(atom | %{:path => any, optional(any) => any}) :: any
  def handle_search_route_mount(uri) do
      if uri.path == "/search" and uri.query != nil do
        send(self(), {:do_product_search, uri.query})
      end
  end

  def render(assigns) do
    ~L"""
    <link href="https://fonts.googleapis.com/css2?family=Encode+Sans+Semi+Condensed:wght@100;200;300;400;500;600;700;800;900&family=Roboto+Flex:opsz,wght@8..144,100;8..144,200;8..144,300;8..144,400;8..144,500;8..144,600;8..144,700;8..144,800;8..144,900;8..144,1000&family=Roboto+Mono:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
    <section class="">
      <%!-- search form --%>
      <form phx-change="search_query" class="col-span-7 <%= if @toggle_text == "" do %>col-span-7<% end %>">
        <%!-- search text input --%>
        <input
          class="w-4/5 my-4 block mx-auto rounded-full text-[24px] text-slate-500 font-['Roboto Flex Thin'] outline-none  border-1 border-solid border-[#c87955] !focus:outline-none focus:ring-[#521c0b] focus:text-[#521c0b] focus:bg-[#fff6f2] focus:text-[#521c0b]"
          phx-debounce="300"
          type="text"
          name="search_query"
          value="<%= @search_query %>"
          placeholder="What are you looking for?"
          autofocus
          autocomplete="off"
          onkeydown="return event.key != 'Enter';"
        />
      </form>

      <%!-- search results toggle --%>
      <%= if @toggle_text != "" do %>
        <button phx-click="toggle" class="col-span-1 block p-2 whitespace-nowrap  w-fit-content text-xs lg:text-sm my-auto mx-auto bg-black font-semibold text-white rounded-full transition duration-300 ease-in-out hover:bg-[silver] hover:text-black"><%= @toggle_text %></button>
      <% end %>
      </section>

    <%!-- search error --%>
    <%= if @search_error != nil do%>
      <section id="search-error" class="font-red-600 w-4/5 mx-auto font-slate-300 py-1">
        <div style="color:red;"><%= @search_error %></div>
      </section>
    <% end %>

    <%!-- loading --%>
    <%= if @show_results do%>
      <%= if @loading do%>
      <% end %>

      <%!-- search summary --%>
      <%= if @products |> Enum.count > 0 do %>

        <section id="search-query-summary" class="font-semibold uppercase w-4/5 mx-auto font-slate-300 py-4">
          <%= if @search_query |> String.length > 2 do%>
            <%= if @uri.path == "/" and @products |> Enum.count > 0 do%>
              <p>Displaying <%= @products |> Enum.count %> products for "<%= @search_query %>" -  <a href="/search?<%= @search_query %>" class="underline">See all results</a></p>
            <% end %>

            <%= if @uri.path == "/search" and @products |> Enum.count > 0 do%>
              <p class="font-slate-100">Displaying <%= @products |> Enum.count %> of <%= @products |> Enum.count %> products for "<%= @search_query %>"</p>
            <% end %>
          <% end %>
        </section>

      <% end %>

      <%!-- no products found for search query --%>
      <%= if @products |> Enum.count < 1 and @search_query |> String.length > 2 do %>

        <section id="search-query-summary no-products" class="font-semibold uppercase w-4/5 mx-auto font-slate-300 py-4">
            <p class="font-slate-100">No products found for "<%= @search_query %>"</p>
        </section>

      <% end %>

      <%!-- product search results --%>
      <%= if @products |> Enum.count > 0 do %>

        <section id="product-search-results" class="pb-4 mx-auto w-4/5 max-h-[600px] overflow-y-auto grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 w-4/5">
          <%= for product <- @products do %>
          <%!-- product --%>
          <div id="<%= product["id"] %>" class="product">
            <div class="bg-gradient-to-t from-[#ffd5c7] to-transparent rounded-md p-4">
              <img src="/images<%= product["picture"] %>" class="cursor-pointer h-[calc(430px*.4)] md:h-[calc(430px*.45)] lg:h-[calc(430px*.5)] transition duration-300 scale-[90%] opacity-[98%] hover:opacity-[100%] hover:scale-[100%] mx-auto"/>
            </div>
            <div>
              <h2 style="font-weight:600;"><%= product["name"] %></h2>
              <p style="font-family:'Roboto Mono'"><%= product["price"] |> String.to_integer |> Money.new(:USD) %></p>
              <div class="bg-gray-50 my-2 p-2 rounded-md  text-sm">
              <p><strong>Product ID:</strong> <span style="font-family:'Roboto Mono'"><%= product["id"] %></span></p>
              <p><strong>Categories:</strong> <span style="font-family:'Roboto Mono'"><%= product["tags"] %></span></p></div>
              <%= if product["isActive"] == "true" do %>
                <button disabled class="font-semibold text-white cursor-not-allowed bg-black px-4 py-2 rounded transition duration-300 ease-in-out hover:bg-[silver] hover:text-black">Buy Now</button>
              <% end %>
              <%= if product["isActive"] == "false" do %>
                <div class="text-red-600 font-semibold">Out of Stock</div>
              <% end %>
            </div>
          </div>
          <% end %>
        </section>
      <% end %>

    <% end %>

    """
  end

    def handle_event("toggle", %{"value" => ""}, socket) do

    socket = assign(socket, show_results: !socket.assigns.show_results)
          toggle_text = case socket.assigns.show_results do
        true -> "Hide Search Results"
        _-> "Show Search Results"
      end
          socket = assign(socket, toggle_text: toggle_text)

    {:noreply, socket}
  end

  def handle_event("search_query", %{"search_query" => search_query}, socket) do
    socket = assign(socket, search_query: search_query)

    if search_query == "" or  String.length(search_query) == 2 do
      send(self(), {:clear_products_from_socket, true})
    end

    # search when query is at least 3 characters
    if String.length(search_query) > 2 do
      send(self(), {:do_product_search, search_query})
    end

    {:noreply, socket}
  end

  def handle_info({:clear_products_from_socket, true}, socket) do
    Logger.info "Clear search results: Search query is empty or less than 3 characters."
    socket = assign(socket, products: [], toggle_text: "")
    {:noreply, socket}
  end

  def handle_info({:product_search_error, response}, socket) do
    Logger.error("Product search error")
    IO.inspect response
    socket = assign(socket, search_error: "There was a problem with the search request.")
    {:noreply, socket}
  end


  def handle_info({:product_search_success, body}, socket) do
    Logger.info("Product search complete")
    {_, response_map} = Poison.decode(body)
    socket = assign(socket, loading: false,show_results: true, toggle_text: "Hide Search Results", products: response_map["data"]["searchProducts"])
    {:noreply, socket}
  end

  def handle_info({:do_product_search, search_query}, socket) do
    Logger.info("Product search underway")
        socket = assign(socket, loading: true)


    search_result_limit =
      case socket.assigns.uri.path do
        "/" -> "searchResultLimit: 4"
        _ -> nil
      end

      url =
        """
        http://localhost:4000/gql/graphiql?variables=&query=
        {
          searchProducts(searchQuery:"#{search_query}", #{search_result_limit})
          {
            id
            picture
            about
            isActive
            price
            name
            about
            tags
          }
        }
        """

    econcoded_url = URI.encode(url)

    {_, response} = HTTPoison.get(econcoded_url)
    %{status_code: status_code, body: body} = response

    case status_code do
      200 ->
        send(self(), {:product_search_success, body})
      _->
        send(self(), {:product_search_error, response})
    end
    {:noreply, socket}
  end
end
