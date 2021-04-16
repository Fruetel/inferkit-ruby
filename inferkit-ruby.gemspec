require_relative 'lib/inferkit/version'

Gem::Specification.new do |spec|
  spec.name = 'inferkit-ruby'
  spec.version = Inferkit::VERSION
  spec.authors = ['Thomas Frütel']
  spec.email = %w[tom@fruetel.de]

  spec.required_ruby_version = '>= 3.0'

  spec.summary = 'Ruby wrapper for https://inferkit.com/'
  spec.description = 'This gem is a Ruby wrapper for InferKit, an AI-based text generator.'
  spec.homepage = 'https://github.com/Fruetel/inferkit-ruby'

  spec.files =
    Dir.chdir(File.expand_path(__dir__)) do
      `git ls-files -z`.split("\x0").reject do |f|
        f.match(%r{^(spec|Dockerfile)/})
      end
    end
  spec.require_paths = %w[lib]

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '>= 1.0.0'
  spec.add_development_dependency 'rubocop-performance', '>= 1.9.1'
  spec.add_development_dependency 'rubocop-rake', '>= 0.5.1'
  spec.add_development_dependency 'rubocop-rspec', '>= 2.0.0'
  spec.add_development_dependency 'webmock', '>= 3.0.0'

  spec.add_dependency 'faraday', '~> 1.0'
  spec.add_dependency 'oj', '~>3.10'
end
