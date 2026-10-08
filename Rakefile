namespace :resume do
    version_string = `git describe --tags --always`.chomp
  if version_string.empty?
    version_string = '0'
  end
  date_string = `date '+%d. %B %Y'`.chomp
  params = "--attribute revnumber='#{version_string}' --attribute revdate='#{date_string}' -a show-link-uri! -a media=prepress"

  desc 'build PDF format'
  task :build_pdf => [:build_all_pdf, :build_cover_letter_pdf, :build_curriculum_vitae_pdf, :build_resume_pdf, :build_cl_pdf, :build_cv_pdf] do
  end

  desc 'build PDF format all in one'
  task :build_all_pdf do
      puts 'Converting to PDF...'
      sh "bundle exec asciidoctor-pdf #{params} --attribute all doc/resume.adoc -o doc/Oleksii_Pokrovskyi_Ro_#{version_string}.pdf"
      puts ' -- PDF output at '
  end

  desc 'build PDF format cover letter only'
  task :build_cover_letter_pdf do
      puts 'Converting to PDF...'
      sh "bundle exec asciidoctor-pdf #{params} --attribute cover-letter doc/resume.adoc -o doc/Oleksii_Pokrovskyi_CLo_#{version_string}.pdf"
      puts ' -- PDF output at '
  end

  desc 'build PDF format curriculum vitae only'
  task :build_curriculum_vitae_pdf do
      puts 'Converting to PDF...'
      sh "bundle exec asciidoctor-pdf #{params} --attribute curriculum-vitae doc/resume.adoc -o doc/Oleksii_Pokrovskyi_CVo_#{version_string}.pdf"
      puts ' -- PDF output at '
  end

  desc 'build PDF format new resume'
  task :build_resume_pdf do
      puts 'Converting to PDF...'
      sh "bundle exec asciidoctor-pdf #{params} --attribute all doc/resume_new.adoc -o doc/Oleksii_Pokrovskyi_R_#{version_string}.pdf"
      puts ' -- PDF output at '
  end

  desc 'build PDF format new cover letter only'
  task :build_cl_pdf do
      puts 'Converting to PDF...'
      sh "bundle exec asciidoctor-pdf #{params} --attribute cover-letter doc/resume_new.adoc -o doc/Oleksii_Pokrovskyi_CL_#{version_string}.pdf"
      puts ' -- PDF output at '
  end

  desc 'build PDF format new curriculum vitae only'
  task :build_cv_pdf do
      puts 'Converting to PDF...'
      sh "bundle exec asciidoctor-pdf #{params} --attribute curriculum-vitae doc/resume_new.adoc -o doc/Oleksii_Pokrovskyi_CV_#{version_string}.pdf"
      puts ' -- PDF output at '
  end
end

task :default => "resume:build_pdf"