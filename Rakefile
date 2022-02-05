HOME_DIR = Dir.home
CURRENT_DIR = File.dirname __FILE__

def sym_link(location)

  target    = "#{CURRENT_DIR}/#{location}"
  link_name = "#{HOME_DIR}/.#{location}"

  if File.exist? link_name
    warn "Path: #{link_name} already exists."
  else
    ln_s target, link_name
  end
end

namespace "vim" do
  task "setup" do

    %w(vimrc vim).each do |file|
      sym_link file
    end
  end
end

namespace "githooks" do
  task "setup" do

    if sym_link "git_template"
      sh "git config --global init.templatedir '~/.git_template'"
      sh "git config --global alias.ctags '!.git/hooks/ctags'"
    end
  end
end

namespace "gitignore" do
  task "setup" do

    if sym_link "gitignore_global"
      sh "git config --global core.excludesfile '~/.gitignore_global'"
    end
  end
end
