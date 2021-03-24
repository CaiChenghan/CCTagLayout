# CCTagLayout

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

CCTagLayout is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

#### 方法一

```ruby
target 'MyApp' do
    pod 'CCTagLayout', :git => 'https://github.com/CaiChenghan/CCTagLayout.git', :tag => '1.0.0'
end
```

#### 方法二

```ruby
platform :ios, '9.0'
inhibit_all_warnings!
source ‘https://github.com/CaiChenghan/CCRepo.git’
source ‘https://github.com/CocoaPods/Specs.git’
target 'MyApp' do
    pod 'CCTagLayout', '~> 1.0.0'
end
```

## Author

1178752402@qq.com, hankcai@hinabian.com

## License

CCTagLayout is available under the MIT license. See the LICENSE file for more info.
