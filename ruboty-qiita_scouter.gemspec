# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/qiita_scouter/version'

# rubocop:disable LineLength
Gem::Specification.new do |spec|
  spec.name          = 'ruboty-qiita_scouter'
  spec.version       = Ruboty::QiitaScouter::VERSION
  spec.authors       = ['tbpgr']
  spec.email         = ['tbpgr@tbpgr.jp']
  spec.summary       = 'An Ruboty Handler + Actions to analyze your Qiita power.'
  spec.description   = 'An Ruboty Handler + Actions to analyze your Qiita power.'
  spec.homepage      = 'https://github.com/tbpgr/ruboty-qiita_scouter'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_dependency 'ruboty'
  spec.add_dependency 'qiita_scouter'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.0'
end
# rubocop:enable LineLength
