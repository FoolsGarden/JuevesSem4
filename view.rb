class View
  
  def add_task(task)
    p "You have added #{task}"
  end

  def show_task(task_list)
    task_list.each_with_index do |task, index|
     if task.completed == "true"
       mark = "X" 
     else
       mark = " "
     end
     puts "#{index + 1}. [#{mark}] #{task.task}" 
    end 
  end


  def deleted_task(task)
    p "You have deleted #{task.task}"
  end





end