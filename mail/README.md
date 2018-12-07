# Mailer

`source <(curl -s https://raw.githubusercontent.com/MuzammilM/scripts/master/mail/mailSetup.sh)`

* `./mailSetup.sh` | prompts for username, password and test recipient mail address if desired.
* `./mailSetup.sh notest` | prompts for username, password ; does not send testmail
* `./mailSetup.sh notest username` | prompts for password ; does not send testmail
* `./mailSetup.sh notest username password` | no useraction required.
* `./mailSetup.sh testmail` |  prompts for username, password and test recipient mail address
* `./mailSetup.sh testmail username` | prompts for password and test recipient mail address
* `./mailSetup.sh testmail username password` | prompts for test recipient mail address
* `./mailSetup.sh testmail username password recipientEmail` | no useraction required ; sends a testmail

## Without prompts
* `./mailSetup.sh notest username password` 
  * no useraction required.
* `./mailSetup.sh testmail username password recipientEmail `
  * no useraction required ; sends a testmail

## Easiest to use
`./mailSetup.sh`

## Best for ansible(IaaS)
`./mailSetup.sh notest username password`


