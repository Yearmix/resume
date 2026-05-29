require 'fiddle'
require 'fiddle/import'

module NativeLocale
  extend Fiddle::Importer
  dlload Fiddle::Handle::DEFAULT
  
  extern 'char* setlocale(int, const char*)'
  extern 'size_t strftime(char*, size_t, const char*, void*)'
  extern 'void* localtime(const long long*)'
  
  LC_ALL = 6 
end

NativeLocale.setlocale(NativeLocale::LC_ALL, ENV['LC_ALL'])
current_seconds = Time.now.to_i
time_ptr = NativeLocale.localtime(Fiddle::Pointer[current_seconds].ref)
buffer = ' ' * 100
NativeLocale.strftime(buffer, buffer.size, '%d. %B %Y', time_ptr)

namespace :resume do
    version_string = `git describe --tags --always`.chomp
  if version_string.empty?
    version_string = '0'
  end
  date_string = buffer.strip
  params = "--attribute revnumber='#{version_string}' --attribute revdate='#{date_string}' -a show-link-uri! -a media=prepress"

  desc 'build PDF format'
  task :build_pdf do
      puts 'Converting to PDF...'
      sh "bundle exec asciidoctor-pdf #{params} doc/resume.adoc -o doc/resume.pdf"
      puts ' -- PDF output at '
  end
end

task :default => "resume:build_pdf"