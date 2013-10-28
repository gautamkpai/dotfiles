namespace "vim" do
  task "setup" do
    home_dir    = Dir.home
    current_dir = File.dirname __FILE__

    %w(vimrc vim).each do |file|
      source      = "#{current_dir}/#{file}"
      destination = "#{home_dir}/.#{file}"

      if File.exist? destination
        warn "Path: #{destination} already exists."
      else
        ln_s source, destination
      end
    end
  end
end
