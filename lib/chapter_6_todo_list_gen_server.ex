defmodule TodoList do
  use GenServer

  @impl GenServer
  def handle_call({:get, key}, _, state) do
    {:reply, Map.get(state, key, nil), state}
  end

  @impl GenServer
  def handle_cast({:put, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

  @impl GenServer
  def init(start_state) do
    {:ok, start_state}
  end

  def start() do
    GenServer.start(__MODULE__, %{}, name: __MODULE__)
  end

  def get_value(key) do
    GenServer.call(__MODULE__, {:get, key})
  end

  def put_value(key, value) do
    GenServer.cast(__MODULE__, {:put, key, value})
  end
end
