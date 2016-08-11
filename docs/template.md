# MODULE INTEGRATION Documentation

## At a high level, what does it do?

_The integration requestor should provide the business use case and articulate how this integration would be different from existing integrations._


## Is this a Marketplace (billable) integration?

_Yes/No (typically, inbound integrations and those for outbound delivery to a CRM are not Marketplace Integrations)_


## If yes to above, what exactly will LeadConduit charge for?

- **YES/NO**, LeadConduit will (/NOT) charge per transaction.
- **YES/NONo**, LeadConduit will (/NOT) charge if no data is returned.
- **YES/NO**, LeadConduit will (/NOT) charge by the number of data points returned.


## What does a success response represent?

- _Define what a success response means._
	- _Does a success response mean the transaction was successful?_
	- _Does a success response mean that the outcome is desirable?_
		- _Example: In the TeleSign integration the outcome is set to success if the phone number is valid._
	- _What attributes, if any of the response lead to it returning success?_
		- _Example: In the TeleSign integration the outcome is a success if the phone number is valid, why?_


## What does a failure response represent?

- _Does a failure response mean the transaction was unsuccessful or no response was received?_
- _What attributes, if any of the response lead to it returning failure? Does a failure response mean that the outcome is not desirable?_
	- _Example: In the TeleSign integration the outcome is failure if the phone number is invalid, bad or disconnected._


## What fields does the integration return?

- _Define every possible returned value._
	- _If there is a limited list of known values to be returned (five "threat categories), then list each with a short description. If it is open-ended or the list of returned values is extensive, provide a short description and link to the fully documented list. For example, "A range indicating the value of a house" or "One country in ISO Country Code format (link to Wikipedia)"._
	- _If data is returned as a code or number, what is the meaning of each code or number?_

* `outcome` - Integration outcome (success, failure, or error)
* `reason` - If outcome is error, the error reason
* `billable` - 1 if the event is billable, or 0 if an error occurred

## What fields are required in the outbound mapping?

- What are the definitions of all of the fields in the outbound mapping?
- What are the necessary fields required to receive a response? For example, the TeleSign integration requires a phone number to be present to return a result.
- How do the field mappings work? For example, the TowerData Personalization integration requires that you select which data points you want returned by mapping to true/false whereas the TowerData Email Verification integration uses standard fields.


## Additional product and technical documentation about the service

Link to the appropriate page(s) on their site as well as any documentation provided directly (stored in the integration folder in Google Drive)
