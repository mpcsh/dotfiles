autocmd! User GoyoEnter call LimelightOn()
function LimelightOn()
  Limelight
endfunction

autocmd! User GoyoLeave call LimelightOff()
function LimelightOff()
  Limelight!
  source ~/.config/nvim/plugin/colorscheme.vim
endfunction
