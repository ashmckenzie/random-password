require 'rcov/rcovtask'

namespace :test do

	desc "Run tests"
	task :run

	puts %x(rspec --format doc test/*.rb)

  namespace :coverage do

    desc "Delete aggregate coverage data."
    task(:clean) { rm_f "coverage.data" }

		task :coverage => "test:coverage:clean"

		Rcov::RcovTask.new() do |t|
			t.libs << "test"
			t.test_files = FileList["test/*.rb"]
			t.output_dir = "coverage/"
			t.verbose = false
			t.rcov_opts << '--aggregate coverage.data --exclude /gems/,/Library/,/usr/,spec,lib/tasks'
		end

	end

end
