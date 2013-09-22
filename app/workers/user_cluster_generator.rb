class UserClusterGenerator
  include Sidekiq::Worker
  attr_accessor :model

  def initialize
    problem = Libsvm::Problem.new
    parameter = Libsvm::SvmParameter.new

    parameter.cache_size = 1_000 # in megabytes

    parameter.c = 1
    parameter.degree = 1
    parameter.coef0 = 0
    parameter.shrinking = 0
    parameter.eps = 0.0001
    parameter.gamma = 0.33
    parameter.kernel_type = Libsvm::KernelType::LINEAR

    examples = []
    labels = []
    User.all.each do |user|
      examples << Libsvm::Node.features([user.gender_num, user.mile_time, user.longest_distance])
      labels << ((user.longest_distance > 6 or user.mile_time < 420_000) ? 1 : 0)
    end

    problem.set_examples(labels, examples)

    @model = Libsvm::Model.train(problem, parameter)
  end

  def perform gender_num, mile_time, longest_distance
    pred = model.predict(Libsvm::Node.features([gender_num, mile_time, longest_distance]))
    Integer(pred)
  end
end

