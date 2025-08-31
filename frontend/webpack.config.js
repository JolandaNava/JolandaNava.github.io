const webpack = require('webpack');
const path = require('path');
const CopyPlugin = require('copy-webpack-plugin');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const { CleanWebpackPlugin } = require('clean-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

module.exports = (env, argv) => {
  const mode = argv.mode == 'production' ? 'production' : 'development';
  const elmDebugger = mode == 'development' && Boolean(env["elm-debugger"]);
  const devMode = mode === 'development';
  const dest = 'build';
  const modulesPath = process.env.NODE_PATH || 'node_modules';

  console.log('Build mode is ' + mode);
  console.log('Elm Debugger: ' + elmDebugger)

  return {
    mode,
    devtool: devMode ? 'eval-source-map' : 'nosources-source-map',
    entry: './src/index.js',

    output: {
      path: __dirname + '/' + dest,
      pathinfo: true,
      filename: devMode ? 'js/[name]-[fullhash].bundle.js' : 'js/[name]-[contenthash].bundle.js',
      chunkFilename: devMode ? 'js/[name]-[fullhash].chunk.js' : 'js/[name]-[contenthash].chunk.js',
      publicPath: '/'
    },

    optimization: {
      // Automatically split vendor and commons
      // https://twitter.com/wSokra/status/969633336732905474
      // https://medium.com/webpack/webpack-4-code-splitting-chunk-graph-and-the-splitchunks-optimization-be739a861366
      splitChunks: {
        chunks: 'all',
        name: 'vendors'
      },
      // Keep the runtime chunk seperated to enable long term caching
      // https://twitter.com/wSokra/status/969679223278505985
      runtimeChunk: true
    },

    cache: {
      type: 'memory',
    },

    performance: {
      maxAssetSize: 20971520,
      assetFilter: (assetFileName) => {
        // ignore gifs in performance warnings
        // these are expected to be big
        return !assetFileName.endsWith('.gif');
      }
    },

    watchOptions: {
      aggregateTimeout: 200
    },

    resolve: {
      enforceExtension: false,
      extensions: ['.js', '.elm', '.scss', '.ts', '.tsx'],
      fallback: {},
      modules: [
        path.join(__dirname, './src'),
        modulesPath,
        path.join(modulesPath, 'node_modules'),
        path.join(modulesPath, '@open-rpc', 'client-js', 'node_modules'),
      ]
    },

    resolveLoader: {
      modules: [
        modulesPath
      ]
    },

    plugins: [
      new CleanWebpackPlugin(),
      // required by plotly.js
      new webpack.ProvidePlugin({
        process: 'process/browser.js',
      }),
      new HtmlWebpackPlugin({
        template: './index.html',
        filename: 'index.html',
      }),
      new MiniCssExtractPlugin({
        // Options similar to the same options in webpackOptions.output
        // both options are optional
        filename: devMode ? 'css/[name]-[fullhash].css' : 'css/[name]-[contenthash].css',
      }),
      // Copy static assets
      new CopyPlugin({
        patterns: [
          { from: 'public/assets', to: 'assets' },
          { from: 'public/fonts', to: 'fonts' },
        ],
      }),
    ],

    module: {
      noParse: /\.elm$/,

      rules: [
        {
          test: /\.elm$/,
          exclude: [/elm-stuff/, /node_modules/],
          use: [
            {
              loader: 'elm-webpack-loader',
              options: {
                optimize: !devMode,
                debug: elmDebugger,
              },
            },
          ],
        },
        {
          test: /\.(sa|sc|c)ss$/,
          use: [
            devMode ? 'style-loader' : MiniCssExtractPlugin.loader,
            {
              loader: 'css-loader',
              options: {
                sourceMap: devMode,
                importLoaders: 1,
                url: false, // disabled for backward compatibility with project structure
              }
            },
            'postcss-loader',
            {
              loader: 'sass-loader',
              options: {
                sassOptions: {
                  sourceMapContents: devMode,
                  sourceMapEmbed: devMode,
                  // Silence deprecations for now since this spams stdout/err too much
                  silenceDeprecations: ['import', 'mixed-decls'],
                  outputStyle: devMode ? "expanded" : "compressed"
                }
              }
            },
          ],
        },
        {
          test: /\.tsx?$/,
          use: [
            {
              loader: 'ts-loader',
              options: {
                compilerOptions: {
                  paths: {
                    '*': [ path.join(modulesPath, '@types', '*'), path.join(modulesPath, '*') ]
                  }
                }
              }
            }
          ],
          exclude: /node_modules/,
        },
        {
          test: /\.js$/,
          exclude: /(node_modules|elm-stuff)/,
          use: [
            {
              loader: 'babel-loader',
              options: {
                babelrc: true,
              }
            },
          ]
        },
        {
          test: /\.html$/,
          use: [
            'html-loader'
          ]
        },
        {
          test: /\.(jpe?g|png|gif|svg|woff|woff2|otf|eot|ttf)$/,
          use: [
            {
              loader: 'url-loader',
              options: {
                limit: 10000
              }
            }
          ]
        },
      ],
    },
  }
}
