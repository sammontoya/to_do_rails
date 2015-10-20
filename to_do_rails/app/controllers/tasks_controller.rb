class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
    render('tasks/index.html.erb')
  end

  def new
    @task = Task.new
   render('tasks/new.html.erb')
  end

  def create
    @task = Task.new(:task => params[:task], :done => false)
    @task.save
      render('tasks/success.html.erb')
  end

  def show
    @task = Task.find(params[:id])
    render('tasks/show.html.erb')
  end


  def done
    @task = Task.find(params[:id])
    @task.done = true
    @task.save
    @tasks = Task.all
    render('tasks/index.html.erb')
  end

  def destroy
    @task = Task.find(params[:id])
    @just_delete_task = @task.task
    @task.destroy
    @tasks = Task.all
    render('tasks/index.html.erb')
  end

  def edit
    @task = Task.find(params[:id])
    render('tasks/edit.html.erb')
  end

  def update
  @task = Task.find(params[:id])
    if @task.update(:task => params[:task], :done => false)
      render('tasks/success.html.erb')
    else
      render('tasks/edit.html.erb')
    end
  end
end
