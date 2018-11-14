Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45882 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726630AbeKOKCC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Nov 2018 05:02:02 -0500
Received: by mail-ot1-f66.google.com with SMTP id 32so15923334ota.12
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Nov 2018 15:56:34 -0800 (PST)
MIME-Version: 1.0
References: <20181114223211.b4a2gjmt5pvtg2bh@zorba> <6c9ff44b-5f27-15d0-c48f-cfd1e2ed33e4@infradead.org>
In-Reply-To: <6c9ff44b-5f27-15d0-c48f-cfd1e2ed33e4@infradead.org>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Thu, 15 Nov 2018 00:56:23 +0100
Message-ID: <CAFkk2KR17FevS7mJKRFRyLCr0jT_aOzJCZXjhce=Ci6vjPi19Q@mail.gmail.com>
Subject: Re: hidden string Kconfig ?
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: danielwa@cisco.com, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, Nov 15, 2018 at 12:16 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 11/14/18 2:32 PM, Daniel Walker wrote:
> > Hi,
> >
> >
> > I'm trying to find out if it's possible to have a string in Kconfig which is
> > hidden from the menu, but still exists in the .config?
> >
> > Like,
> >
> > HIDDEN_STRING
> >       string
> >
> > then in the config file there would be,
> > CONFIG_HIDDEN_STRING="hidden"
> >
> > and the config option wouldn't be used for anything inside Kconfig. It would
> > just get set from the .config , or not be set?
> >
> > The above sample, I've not been able to make work. The string in the .config
> > gets erased when menuconfig runs.
> >
> > Any help appreciated.
>
> Hi,
>
> There are several "string" Kconfig symbols in init/Kconfig that do not have
> a prompt string after them.  I believe that these do what you are asking about.
> If not, please provide your example that is not working.
>
> Or:  this one works for me:
>
> ---
>  init/Kconfig |    4 ++++
>  1 file changed, 4 insertions(+)
>
> --- linux-next-20181114.orig/init/Kconfig
> +++ linux-next-20181114/init/Kconfig
> @@ -1858,6 +1858,10 @@ config CMDLINE
>
>  endif
>
> +config SPECIAL_STRING
> +       string
> +       default "special"
> +
>  endmenu                # General setup
>
>  source "arch/Kconfig"

This will work.

Also worth noting is that assignments to symbols without prompts
('string "prompt"') in .config files have no effect on the symbol's
value when the .config file is read back in by Kconfig. Setting a
symbol's value in a .config file is effectively the same as setting it
in the menuconfig interface.

The reason promptless symbols still get written out is that it makes
.config a complete configuration file, which is important when .config
files are included in Makefiles to read configuration settings from
there (.config files use Make syntax).

As a note, Kbuild includes include/config/auto.conf (a generated
configuration file) instead of .config. That makes the build work even
if .config is outdated (you get an implicit olddefconfig).

Cheers,
Ulf
