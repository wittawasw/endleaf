namespace :endleaf do
  namespace :render do
    desc 'Render and save static pages as HTML'

    task :generate_html => :environment do
      # Include the necessary modules to access render_to_string
      controller_path = 'endleaf/pages'
      action_name = 'show'

      # Create a controller instance
      controller = ActionController::Base.new
      controller.request = ActionDispatch::Request.new({})

      # Set the controller path and action name
      controller.params = { controller: controller_path, action: action_name }

      # Define the directory containing your static pages within the engine
      pages_directory = Rails.root.join('app', 'views', 'pages')

      # Loop through each file in the pages directory
      Dir.glob("#{pages_directory}/*.html.erb") do |file|
        # Extract the filename without the directory and extension
        filename = File.basename(file, '.html.erb')

        # Render the page
        html_content = controller.render_to_string(template: "pages/#{filename}", layout: 'endleaf')

        # Define the path to save the HTML file in the public directory
        save_path = Rails.root.join('public', "#{filename}.html")

        # Save the rendered HTML to the file
        File.write(save_path, html_content)

        puts "Rendered and saved #{filename}.html"
      end
    end
  end
end
