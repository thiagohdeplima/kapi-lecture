defmodule Invillia.Stack do
  use GenServer

  def init(state \\ []) do
    {:ok, state}
  end

  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:push, item}, state) do
    {:noreply, [item | state]}
  end
end