require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'json'
require 'slim'
require 'blackjack2'
require './app'

set :run, false
set :raise_erros, true
 set :root, File.dirname(__FILE__)
set :static, true
set :public_dir, 'public'




run Sinatra::Application
