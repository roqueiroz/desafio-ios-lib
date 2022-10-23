Pod::Spec.new do |spec|

  spec.name         = "Desafio-iOS-Lib"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of Desafio-iOS-Lib."

  spec.description  = <<-DESC
    Pod para gerar Ticket
                   DESC

  spec.homepage     = "https://github.com/roqueiroz/desafio-ios-lib"
  spec.license = { :type => "MIT", :file => "LICENSE" }
  spec.author = { "r queiroz" => "rqueiroz.dev@gmail.com" }
  spec.ios.deployment_target = "9.0"

  spec.source = { :git => "https://github.com/roqueiroz/desafio-ios-lib.git", :tag => "#{spec.version}" }
  spec.source_files  = "Desafio-iOS-Lib/**/*.{h,m,swift}"
  
end
