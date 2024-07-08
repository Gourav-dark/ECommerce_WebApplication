using Microsoft.AspNetCore.Identity.UI.Services;

namespace ECommerce_App.Utility
{
    public class EmailSender : IEmailSender
    {
        public Task SendEmailAsync(string email, string subject, string htmlMessage)
        {
            //Logic of Email Send
            return Task.CompletedTask;
        }
    }
}
