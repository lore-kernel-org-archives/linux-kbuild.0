Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:40189 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750933Ab0LIP6m convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Dec 2010 10:58:42 -0500
Received: by gyb11 with SMTP id 11so1450665gyb.19
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Dec 2010 07:58:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4D009D4A0200007800026DDB@vpn.id2.novell.com>
References: <4D009D4A0200007800026DDB@vpn.id2.novell.com>
Date: Thu, 9 Dec 2010 10:58:41 -0500
Message-ID: <AANLkTikrnC4mbFN31Ct90St7f7Hv0a0Z4TR6qPs+4w-t@mail.gmail.com>
Subject: Re: [PATCH] fix undesirable side effect of adding "visible" menu attribute
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@novell.com>
Cc: linux-kbuild@vger.kernel.org, mchehab@redhat.com, Michal Marek <mmarek@suse.cz>

Hi,

On Thu, Dec 9, 2010 at 3:11 AM, Jan Beulich <JBeulich@novell.com> wrote:
> This lead to non-selected, non-user-selectable options to be written
> out to .config. This is not only pointless, but also preventing the
> user to be prompted should any of those options eventually become
> visible (e.g. by de-selecting the *_AUTO options the "visible"
> attribute was added for.
>
> Furthermore it is quite logical for the "visible" attribute of a menu
> to control the visibility of all contained prompts, which is what the
> patch does.
>
> Signed-off-by: Jan Beulich <jbeulich@novell.com>
>
> ---
>  scripts/kconfig/menu.c |   14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> --- 2.6.37-rc5/scripts/kconfig/menu.c
> +++ 2.6.37-rc5-kconfig-propagate-visibility/scripts/kconfig/menu.c
> @@ -140,6 +140,20 @@ struct property *menu_add_prop(enum prop
>                }
>                if (current_entry->prompt && current_entry != &rootmenu)
>                        prop_warn(prop, "prompt redefined");
> +
> +               /* Apply all upper menus' visibilities to actual prompts. */
> +               if(type == P_PROMPT) {
> +                       struct menu *menu = current_entry;
> +
> +                       while ((menu = menu->parent) != NULL) {
> +                               if (!menu->visibility)
> +                                       continue;
> +                               prop->visible.expr
> +                                       = expr_alloc_and(prop->visible.expr,
> +                                                        menu->visibility);
> +                       }
> +               }
> +
Shouldn't this better to be done in menu_finalize() ?

I'm not either a big fan of testing `menu->visibility' truth, it is an
expression which should be expended by the proper expr_* accessor to
have less things to fix later.

 - Arnaud

>                current_entry->prompt = prop;
>        }
>        prop->text = prompt;
>
>
>
>
