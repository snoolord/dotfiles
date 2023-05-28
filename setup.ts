#!/usr/bin/env ts-node
import { exec } from "child_process"

const homebrewApplicationInstallCommands = {
  vsCode: "brew install --cask visual-studio-code",
  raycast: "brew install --cask raycast",
  adguard: "brew install --cask adguard",
  mackup: "brew install mackup",
  pixelSnap: "brew install --cask pixelsnap",
  btt: "brew install --cask bettertouchtool",
  googleDrive: "brew install --cask google-drive",
  dropbox: "brew install --cask dropbox",
  spotify: "brew install --cask spotify",
  vlc: "brew install --cask vlc",
  figma: "brew install --cask figma",
  orion: "brew install --cask orion",
  chrome: "brew install --cask google-chrome",
  karabiner: "brew install --cask karabiner-elements",
  discord: "brew install --cask discord",
  fontbase: "brew install --cask fontbase",
  fzf: "brew install fzf",
}

Object.values(homebrewApplicationInstallCommands).forEach((command) => {
  exec(command, (error, stdout, stderr) => {
    if (error) {
      console.log(`error: ${error.message}`)
      return
    }
    if (stderr) {
      console.log(`stderr: ${stderr}`)
      return
    }
    console.log(`stdout: ${stdout}`)
  })
})

// remove disk ejected unsafely notification
exec(
  "sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist DADisableEjectNotification -bool YES && sudo pkill diskarbitrationd",
  (error, stdout, stderr) => {
    if (error) {
      console.log(`error: ${error.message}`)
      return
    }
    if (stderr) {
      console.log(`stderr: ${stderr}`)
      return
    }
    console.log(`stdout: ${stdout}`)
  },
)
