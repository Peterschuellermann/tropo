# This script calls the home inhabitant and asks him about the fire
# First it asks him, if he is in the home
# yes -> if there is a fire
#   yes -> it connects to the fire department
#   no -> abort and log
# no or no response -> it calls neighbours to ask if they could check
#   yes -> wait for the neighbours to check
#     fire -> it calls callFireDepartment()
#     no fire -> abort and log
#   no or no response -> it calls callFireDepartment()

# requires the following
# https://api.tropo.com/1.0/sessions?action=create
# &token=TOKEN
# &customerTelephone=14075551212
# &customerName=John+Dyer
# &msg=the+sky+is+falling


def callHomeInhabitant()

  call '+' + $customerTelephone

  owner_at_home = greetInhabitant()

  inhabitantDialog(owner_at_home)


  log "The inhabitants are at home: " + owner_at_home.value


end


# explains the situation and returns if someone is at home
def greetInhabitant()

  say "Hello " + $customerName + ", we received note that your house may be on fire!"

  log "The home inhabitants are called " + $customerName

  atHome= ask "Are you at home?", {
      :choices => "yes, no"}

  say "You said " + atHome.value

  return atHome

end


def inhabitantDialog(owner_at_home)
  if owner_at_home.value=="yes"
    home_on_fire = ask "Is there a fire?", {
        :choices => "yes, no"}
    if home_on_fire.value=="yes"
      say "we will connect you to the fire department."
    else
      say "thank you for checking. be safe!"
    end
  else
    say " we will call your neighbours to check in on your home."
  end


end


def callNeighbours()


end


def callFiredepartment()

end