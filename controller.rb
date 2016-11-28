require_relative "model.rb"
require_relative "view.rb"

class Controller

  def initialize(input)
    puts "*" * 50
    # @input = input
    @command = input[0]
    @view  = View.new
    @list = List.new
    menu(input) 
  end

  def menu(input)
    task = input[1..-1].join(' ')
    case @command
      when "add" then to_do_list(task)
      when "index" then index
      when "delete" then delete(task)
      when "complete" then complete(task)
    end
  end

  def to_do_list(task)
    new_task = Task.new(task)
    @list.csv_creator(new_task)
    @view.add_task(task)
  end

  def index
    task_list = @list.csv_reader
    @view.show_task(task_list)
  end

  def delete(input)
    task_deleted = @list.csv_delete(input)
    @view.deleted_task(task_deleted)
    @list.new_tasks
    #llamar a un método delete de la clase list
    #recibir el número a borrar
    #pasar tarea borrada a un método de la clase view
  end

  def complete(input)
    completed_task = @list.completed(input) 
    @view.show_task(completed_task)
  end

end

input = ARGV
imprime = Controller.new(input)


