# Make sure we're using the latest Homebrew
update

# Upgrade any already-installed formulae
upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don't forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install coreutils
# Install some other useful utilities like `sponge`
install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
install findutils
# Install zsh
install zsh

# Install more recent versions of some OS X tools
install vim --override-system-vi
install homebrew/dupes/grep

# Install brew cask
install cask

# Install other useful binaries
install ack
install pv
install git
install imagemagick --with-webp
install lynx
install mc
install node
install pigz
install rename
install rhino
install tree
install webkit2png
install zopfli
install p7zip

install homebrew/versions/lua52

# Remove outdated versions from the cellar
cleanup
