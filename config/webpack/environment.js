const { environment } = require('@rails/webpacker');
const webpack = require('webpack');

new webpack.ProvidePlugin({
  $: 'jquery-datetimepicker'
})

module.exports = environment
