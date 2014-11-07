# Twitter Screenshots

Takes retina quality screenshots of specified tweet, trims it and saves the PNG to the screenshots directory with a username_tweetid filename.

## Constraints

Uses Firefox as it is the sole selenium driver that allows for webfonts, full page length screenshots and retina quality.

Note: Retina quality is an approximation as it relies on scaling the content with CSS transformation.

## Usage
1. install Firefox

2. run bundler

    bundle

3. try it  

    `bundle exec ruby screenshot.rb https://twitter.com/GreatDismal/status/530073123249729536`

4. look at the png file which was generated in screenshots directory