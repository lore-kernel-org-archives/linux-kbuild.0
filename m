Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb1-smtp-cloud6.xs4all.net ([194.109.24.24]:44461 "EHLO
	lb1-smtp-cloud6.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752590AbbE0IUo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 27 May 2015 04:20:44 -0400
Message-ID: <1432714841.27695.250.camel@x220>
Subject: Re: [PATCH] gconf: Unify exit dialog with the one from qconf
From: Paul Bolle <pebolle@tiscali.nl>
Date: Wed, 27 May 2015 10:20:41 +0200
In-Reply-To: <1432237998-30330-1-git-send-email-leonidsbox@gmail.com>
References: <1432237998-30330-1-git-send-email-leonidsbox@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Leonid V. Fedorenchik" <leonidsbox@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

[Yann disappeared, but you couldn't know that.]

On Thu, 2015-05-21 at 22:53 +0300, Leonid V. Fedorenchik wrote:
> Make exit dialog more user-friendly and, at the same time, make it
> similar to the one from qconf.

Could you please describe, in the commit explanation, the dialog before
and after this change. Now we have to fire up gconf and qconf to get an
idea of this proposal. (I use neither. I don't know whether these
front-ends are used much.)

> Signed-off-by: Leonid V. Fedorenchik <leonidsbox@gmail.com>
> ---
>  scripts/kconfig/gconf.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index 26d208b..9348c9f 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -422,21 +422,21 @@ gboolean on_window1_delete_event(GtkWidget * widget, GdkEvent * event,
>  	if (!conf_get_changed())
>  		return FALSE;
>  
> -	dialog = gtk_dialog_new_with_buttons(_("Warning !"),
> +	dialog = gtk_dialog_new_with_buttons(_("gconf"),
>  					     GTK_WINDOW(main_wnd),
>  					     (GtkDialogFlags)
>  					     (GTK_DIALOG_MODAL |
>  					      GTK_DIALOG_DESTROY_WITH_PARENT),
> -					     GTK_STOCK_OK,
> +					     _("Save Changes"),
>  					     GTK_RESPONSE_YES,
> -					     GTK_STOCK_NO,
> +					     _("Discard Changes"),
>  					     GTK_RESPONSE_NO,
> -					     GTK_STOCK_CANCEL,
> +					     _("Cancel Exit"),
>  					     GTK_RESPONSE_CANCEL, NULL);
>  	gtk_dialog_set_default_response(GTK_DIALOG(dialog),
>  					GTK_RESPONSE_CANCEL);
>  
> -	label = gtk_label_new(_("\nSave configuration ?\n"));
> +	label = gtk_label_new(_("\nSave configuration?\n"));
>  	gtk_container_add(GTK_CONTAINER(GTK_DIALOG(dialog)->vbox), label);
>  	gtk_widget_show(label);

Thanks,


Paul Bolle

