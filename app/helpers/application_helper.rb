module ApplicationHelper
  def title(text)
    content_for :title, text
  end

  def oauth2_scopes()
  return [
    {
      scope: "profile:edit",
      description: "Make edits to your profile"
    },
    {
      scope: "profile:all",
      description: "Access all your profile information"
    },
    {
      scope: "profile:dob",
      description: "Access your Date of Birth"
    },
    {
      scope: "profile:phoneNumber",
      description: "Access your Phone Number"
    },
    {
      scope: "profile:legalName",
      description: "Access your Legal Name"
    },
    {
      scope: "profile:preferredName",
      description: "Access your Preferred Name"
    },
    {
      scope: "profile:slackID",
      description: "Access your Hack Club Slack ID"
    }
  ]
  end
end
