Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ww0-f42.google.com ([74.125.82.42]:40010 "EHLO
	mail-ww0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752394Ab0IKQFe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Sep 2010 12:05:34 -0400
Received: by wwb13 with SMTP id 13so828459wwb.1
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Sep 2010 09:05:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1284220282-3500-10-git-send-email-lacombar@gmail.com>
References: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
	<1284220282-3500-10-git-send-email-lacombar@gmail.com>
Date: Sat, 11 Sep 2010 12:05:32 -0400
Message-ID: <AANLkTikBRvkOa=NDcfo7JL-VxycLB2tBY7nrj8Q3aXm3@mail.gmail.com>
Subject: Re: [PATCH 09/15] kconfig: replace KERNELVERSION usage by the
 mainmenu's prompt
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

Hi,

On Sat, Sep 11, 2010 at 11:51 AM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> @@ -797,15 +795,13 @@ int conf_write_autoconf(void)
>                return 1;
>        }
>
> -       sym = sym_lookup("KERNELVERSION", 0);
> -       sym_calc_value(sym);
>        time(&now);
>        fprintf(out, "#\n"
>                     "# Automatically generated make config: don't edit\n"
> -                    "# Linux kernel version: %s\n"
> +                    "# %s\n"
>                     "# %s"
>                     "#\n",
> -                    sym_get_string_value(sym), ctime(&now));
> +                    rootmenu.prompt->text, ctime(&now));
>        fprintf(tristate, "#\n"
>                          "# Automatically generated - do not edit\n"
>                          "\n");
d'oh! I missed one occurence of "Linux kernel version:..." right below
that one :(

Fixed in the `kbuild-generic-v6' branch of the github repo, as is the
extra strdup().

 - Arnaud
