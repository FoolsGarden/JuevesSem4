require 'csv'

class Task
  attr_accessor :task, :completed, :array_tasks

  def initialize(task, completed=false)
    @task = task
    @completed = completed
  end
end

class List

  def csv_creator(input)
    CSV.open("list.csv", "a") do |csv| 
         csv << [input.task, input.completed]
    end 
  end
   
  def csv_reader
    @array_tasks = []
    csv = CSV.read("list.csv")
    csv.each do |row|
      @array_tasks << Task.new(row[0], row[1])
   end
   @array_tasks
  end

  def csv_delete(input)
    @tasks_list = List.new.csv_reader
    @tasks_list.each_with_index do |task, index|
     return @tasks_list.delete(task) if index == (input.to_i - 1)
    end
  end

  def new_tasks
    CSV.open("list.csv", "wb") do |csv|
      @tasks_list.each do |i|
      csv << [i.task]
    end
    end
  end

  def completed(possition)
    csv_reader
    pos = (possition.to_i)
    @array_tasks.each_with_index do |task, index|
      if index + 1 == pos
        task.completed = true
      end
    end
    CSV.open("list.csv", "wb") do |csv|
      @array_tasks.each do |i|
        csv << [i.task, i.completed]
      end
    end
    csv_reader
  end
end



