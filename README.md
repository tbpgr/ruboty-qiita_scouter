# Ruboty::QiitaScouter

A Ruboty Handler + Actions plugin to analyze your Qiita power.

[![Gem Version](https://badge.fury.io/rb/ruboty-qiita_scouter.svg)](http://badge.fury.io/rb/ruboty-qiita_scouter)

[Ruboty](https://github.com/r7kamura/ruboty) is Chat bot framework. Ruby + Bot = Ruboty

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-qiita_scouter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruboty-qiita_scouter

## Usage
### Analyze your qiita power

~~~
> ruboty help
ruboty /qiita scouter (?<id>.+?)\z/ - analyze qiita power

# exist user
> ruboty qiita scouter tbpgr
ユーザー名: tbpgr 戦闘力: 218544 攻撃力: 27840 知力: 183860 すばやさ: 6844

# not exist user
> ruboty qiita scouter invalid_user
Failed by OpenURI::HTTPError
~~~

## ENV
nothing

## Screenshot
nothing

## Dependency
* [QiitaScouter gem](https://github.com/tbpgr/qiita_scouter)
    * QiitaScouter gem depend on [Qiita Developer API v1](https://qiita.com/docs)

## Reference
* This plugin's product code template is generated by [ruboty-gen GitHub](https://github.com/blockgiven/ruboty-gen)
* This plugin's test code template is generated by [rspec_piccolo GitHub](https://github.com/tbpgr/rspec_piccolo)

## Contributing

1. Fork it ( https://github.com/tbpgr/ruboty-qiita_scouter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
