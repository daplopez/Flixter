# Project 1 - Flixter
Flixter is a movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: 14 hours spent in total

## User Stories

The following **required** functionality is complete:

- [x] User sees an app icon on the home screen and a styled launch screen.
- [x] User can view a list of movies currently playing in theaters from The Movie Database.
- [x] Poster images are loaded using the UIImageView category in the AFNetworking library.
- [x] User sees a loading state while waiting for the movies API.
- [x] User can pull to refresh the movie list.
- [x] User sees an error message when there's a networking error.
- [x] User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

The following **optional** features are implemented:

- [ ] User can tap a poster in the collection view to see a detail screen of that movie
- [ ] User can search for a movie.
- [ ] All images fade in as they are loading.
- [ ] User can view the large movie poster by tapping on a cell.
- [ ] For the large poster, load the low resolution image first and then switch to the high resolution image when complete.
- [ ] Customize the selection effect of the cell.
- [ ] Customize the navigation bar.
- [ ] Customize the UI.
- [ ] Run your app on a real device.

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. How to use the API to include a larger database of movies. 
2. Different ways to create a custom layout of a collection view. 

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://github.com/daplopez/Flixter/blob/main/Flixter/flixterWalkthroughGif.gif' title='Video Walkthrough' width='320px' alt='Video Walkthrough' />

GIF created with [Kap](https://getkap.co/).

## Notes

I encountered many challenges in the beginning as I was unfamiliar with the Objective C language
and Xcode. However, I soon became more familiar with them. I also faced challenges with segues
and formatting images. For example, it took me a while to figure out how to change the
collection view layout and in the 'Now Playing' tab, the poster images didn't end up exactly as I
originally wanted them to.

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library

## License

    Copyright 2022 Daphne Lopez

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
