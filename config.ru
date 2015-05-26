require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'json'
require 'slim'
require 'blackjack2'
require './app'

set :run, false
set :raise_erros, true


run Sinatra::Application
