# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

# この一行でRailsとlib/tasks配下のRakeタスクが追加される
Rails.application.load_tasks

# これをつけるとアノテートのタスクが追加される
Annotate.load_tasks if defined?(Annotate)

# migrateのタスクをフックする
# このタスクが実行された後にブロック内のコードが実行される
Rake::Task['db:migrate'].enhance do
  Rake::Task[:annotate_models].invoke if defined?(Annotate) && Rails.env.development?
end