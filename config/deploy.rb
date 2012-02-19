# RVM

$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
set :rvm_ruby_string, 'default'
set :rvm_type, :user

# Bundler

require "bundler/capistrano"

# General

set :application, "FMBuzz"
set :user, "n0de"

set :deploy_to, "/home/#{user}/#{application}"
set :deploy_via, :copy

set :use_sudo, false

# Git

set :scm, :git
set :repository,  "git@github.com:cmfoster/FMBuzz.git"
set :branch, "master"
set :scm_passphrase, "cooler17"

# VPS

role :web, "74.207.237.5"
role :app, "74.207.237.5"
role :db,  "74.207.237.5", :primary => true
role :db,  "74.207.237.5"

# Passenger

namespace :deploy do
 task :start do ; end
 task :stop do ; end
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 end
end

