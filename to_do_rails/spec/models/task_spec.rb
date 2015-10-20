require 'rails_helper'

describe Task do
  it "should validate a name" do
    task_name = Task.new({:task => '' })
      expect(task_name.save).to eq false
  end


  it "can be marked done" do
    new_task = Task.new({:done => false}) #this creates a new task`
    expect(new_task.done).to eq false #this sayas done value should be false
    new_task.done = true #this changes done to true
    expect(new_task.done).to eq true #this says done value should be true
  end


end
