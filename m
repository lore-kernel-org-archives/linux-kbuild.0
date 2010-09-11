Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:40854 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752452Ab0IKP5r convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Sep 2010 11:57:47 -0400
Received: by wyf22 with SMTP id 22so4220721wyf.19
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Sep 2010 08:57:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1284220282-3500-9-git-send-email-lacombar@gmail.com>
References: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
	<1284220282-3500-9-git-send-email-lacombar@gmail.com>
Date: Sat, 11 Sep 2010 11:57:46 -0400
Message-ID: <AANLkTikd7SnHv79TV-mW_=BR6ORWcDFS8ut5hRMLDtoz@mail.gmail.com>
Subject: Re: [PATCH 08/15] kconfig: expand by default the rootmenu's prompt
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

Hi,

On Sat, Sep 11, 2010 at 11:51 AM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  scripts/kconfig/zconf.y |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
> index e9b14efd..c95e67e 100644
> --- a/scripts/kconfig/zconf.y
> +++ b/scripts/kconfig/zconf.y
> @@ -502,6 +502,10 @@ void conf_parse(const char *name)
>                prop = prop_alloc(P_DEFAULT, modules_sym);
>                prop->expr = expr_alloc_symbol(sym_lookup("MODULES", 0));
>        }
> +
> +       rootmenu.prompt->text = strdup(_(rootmenu.prompt->text));
> +       rootmenu.prompt->text = sym_expand_string_value(rootmenu.prompt->text);
> +
actually, this strdup(3) is useless as it will be performed by
sym_expand_string_value().

 - Arnaud
