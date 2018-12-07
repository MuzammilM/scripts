# Mailer

* `./mailSetup.sh` | prompts for username, password and test recipient mail address if desired.
* `./mailSetup.sh notest` | prompts for username, password ; does not send testmail
* `./mailSetup.sh notest gusername` | prompts for password ; does not send testmail
* `./mailSetup.sh notest gusername gpassword` | no useraction required.
* `./mailSetup.sh testmail` |  prompts for username, password and test recipient mail address
* `./mailSetup.sh testmail gusername` | prompts for password and test recipient mail address
* `./mailSetup.sh testmail gusername gpassword` | prompts for test recipient mail address
* `./mailSetup.sh testmail gusername gpassword recipientEmail` | no useraction required ; sends a testmail

## Without prompts
* `./mailSetup.sh notest gusername gpassword` 
  * no useraction required.
* `./mailSetup.sh testmail gusername gpassword recipientEmail `
  * no useraction required ; sends a testmail.

## Easiest to use
`./mailSetup.sh`

## Best for ansible(IaaS)/ One click Installations
`curl -s https://raw.githubusercontent.com/MuzammilM/scripts/master/mail/mailSetup.sh | bash -s notest gusername gpassword`
* Installs heirloom-mailx and configures ssmtp.

`curl -s https://raw.githubusercontent.com/MuzammilM/scripts/master/mail/mailSetup.sh | bash -s testmail gusername gpassword recipientEmail`
* Installs heirloom-mailx and configures ssmtp and sends a testmail to recipient.
