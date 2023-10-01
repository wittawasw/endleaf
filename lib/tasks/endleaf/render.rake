namespace :endleaf do
  namespace :render do
    desc 'Render and save static pages as HTML'

    task :generate_html => :environment do
      # Manually set the controller path and action name
      controller_path = 'endleaf/pages'
      action_name = 'show'

      controller = ActionController::Base.new
      controller.request = ActionDispatch::Request.new({})

      # Set the controller path and action name
      controller.params = { controller: controller_path, action: action_name }

      # Set static pages directory
      pages_dir = "pages"

      # Define the directory containing your static pages within the engine
      pages_directory = Rails.root.join("app", "views", pages_dir)

      # Supported template extensions
      template_extensions = %w[html.erb erb html.haml haml html.slim slim]

      puts "#{pages_directory}/**/*.{#{template_extensions.join(',')}}"

      # Loop through each file in the pages directory and subdirectories
      Dir.glob("#{pages_directory}/**/*.{#{template_extensions.join(',')}}") do |file|
        # Extract the relative path from the pages directory
        relative_path = Pathname.new(file).relative_path_from(pages_directory).to_s

        # Extract the filename without the extension
        filename = File.basename(file, '.*')

        # Construct the absolute path to the template file
        template_path = "#{pages_dir}/#{relative_path.sub(/\.(#{template_extensions.join('|')})$/, '')}"
        puts "template: #{template_path}"

        # Render the page using the controller's render_to_string method
        html_content = controller.render_to_string(
          template: template_path,
          layout: "endleaf"
        )

        # Define the path to save the HTML file in the public directory
        # Modify save_path logic to generate 'example/index.html' format
        save_path = Rails.root.join('public', "#{relative_path.sub(/\.html\.erb$/, '')}/index.html")

        # Create directories if they don't exist
        FileUtils.mkdir_p(File.dirname(save_path))

        # Save the rendered HTML to the file
        File.write(save_path, html_content)

        puts "Rendered and saved #{save_path}"
      end
    end
  end
end
