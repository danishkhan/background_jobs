run "sudo monit stop all -g fractalresque_resque"
if %x[ps axo command|grep resque[-]|grep -c Forked].to_i > 0 
  raise "Resque Workers Working!!"
end