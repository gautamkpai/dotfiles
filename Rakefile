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

namespace "githooks" do
  task "setup" do

    if sym_link "git_template"
      sh "git config --global init.templatedir '~/.git_template'"
      sh "git config --global alias.ctags '!.git/hooks/ctags'"
    end
  end
end
