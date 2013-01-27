# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'spork', :wait => 30, :rspec_env => { 'RAILS_ENV' => 'test' } do
  watch(%r{^app/models/.+\.rb$})
  watch('spec/dummy/config/application.rb')
  watch('spec/dummy/config/environment.rb')
  watch(%r{^spec/dummy/config/environments/.+\.rb$})
  watch(%r{^spec/dummy/app/models/.+\.rb$})
  watch(%r{^config/initializers/.+\.rb$})
  watch('spec/spec_helper.rb')# { :rspec }
end

guard 'rspec', :version => 2, :all_after_pass => false, :all_on_start => false, :spec_paths => Dir["{spec,./spec}"], :cli => "--drb --color -fd -o doc/spec.txt" do
  watch('config/routes.rb')                          { Dir["./spec/routing"] }
  watch('app/controllers/application_controller.rb') { Dir["./spec/controllers/**/*_spec.rb"] }

  watch(%r{^spec/(.+)_spec\.rb$})                    { |m| "./spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.+)\.rb$})                          { |m| "./spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.+)\.(haml|erb)$})                  { |m| "./spec/#{m[1]}.#{m[2]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$})                          { |m| "./spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$}) { |m| ["./spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "./spec/acceptance/#{m[1]}_spec.rb"] }
end


