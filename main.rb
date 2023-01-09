require './project'
require './sequence'
require './reimbursement'

HIGH_COST  = :high_cost
LOW_COST =  :low_cost

def calculate_set1
  project1 = Project.new('Project1', LOW_COST, '9/1/15', '9/3/15' )
  sequence = Sequence.new('Set1', [project1])
  Reimbursement.new(sequence).to_s
end

def calculate_set2
  project1 = Project.new('Project1', LOW_COST, '9/1/15', '9/1/15')
  project2 = Project.new('Project2', HIGH_COST, '9/2/15', '9/6/15')
  project3 = Project.new('Project3', LOW_COST, '9/6/15', '9/8/15')
  projects = [project1, project2, project3]
  sequence = Sequence.new('Set2', projects)
  Reimbursement.new(sequence).to_s
end

def calculate_set3
  project1 = Project.new('Project1', LOW_COST, '9/1/15', '9/3/15')
  project2 = Project.new('Project2', HIGH_COST, '9/5/15', '9/7/15')
  project3 = Project.new('Project3', HIGH_COST, '9/8/15', '9/8/15')
  projects = [project1, project2, project3]
  sequence = Sequence.new('Set3', projects)
  Reimbursement.new(sequence).to_s
end

def calculate_set4
  project1 = Project.new('Project1', LOW_COST, '9/1/15', '9/1/15')
  project2 = Project.new('Project2', LOW_COST, '9/1/15', '9/1/15')
  project3 = Project.new('Project3', HIGH_COST, '9/2/15', '9/2/15')
  project4 = Project.new('Project4', HIGH_COST, '9/2/15', '9/3/15')
  projects = [project1, project2, project3, project4]
  sequence = Sequence.new('Set4', projects)
  Reimbursement.new(sequence).to_s
end

calculate_set1
calculate_set2
calculate_set3
calculate_set4
