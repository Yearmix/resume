namespace :resume do
    version_string = `git describe --tags --always`.chomp
  if version_string.empty?
    version_string = '0'
  end
  date_string = `date '+%d. %B %Y'`.chomp
  params = "--attribute revnumber='#{version_string}' --attribute revdate='#{date_string}' -a show-link-uri! -a media=prepress"

  desc 'build PDF format'
  task :build_pdf do
      puts 'Converting to PDF...'
      sh "bundle exec asciidoctor-pdf #{params} doc/resume.adoc -o doc/resume.pdf"
      puts ' -- PDF output at '
  end
end

task :default => "resume:build_pdf"