Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua1-f65.google.com ([209.85.222.65]:40179 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbfDKQ7U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Apr 2019 12:59:20 -0400
Received: by mail-ua1-f65.google.com with SMTP id b8so2261683uaq.7
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Apr 2019 09:59:20 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 2sm19556096vke.27.2019.04.11.09.59.16
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Apr 2019 09:59:16 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id j184so3888681vsd.11
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Apr 2019 09:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190410161612.18545-1-keescook@chromium.org> <20190410161612.18545-2-keescook@chromium.org>
 <CAK7LNASLdZKNNM-Gft5bfVxKOG=4Ak-LBMnjb2E-QR4q_5GmEQ@mail.gmail.com>
In-Reply-To: <CAK7LNASLdZKNNM-Gft5bfVxKOG=4Ak-LBMnjb2E-QR4q_5GmEQ@mail.gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 11 Apr 2019 09:59:04 -0700
Message-ID: <CAGXu5j+S1He+2sR+cvjV=2xAcCHQoRv942+OAEDprMmB=TF4Bw@mail.gmail.com>
Subject: Re: [PATCH 1/3] Kconfig: Create "kernel hardening" config area
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Alexander Potapenko <glider@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Kostya Serebryany <kcc@google.com>, Dmitry Vyukov <dvyukov@google.com>, Sandeep Patil <sspatil@android.com>, Laura Abbott <labbott@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, Alexander Popov <alpopov@ptsecurity.com>, Michal Marek <michal.lkml@markovi.net>, Emese Revfy <re.emese@gmail.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>, Kernel Hardening <kernel-hardening@lists.openwall.com>

On Thu, Apr 11, 2019 at 1:51 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Thu, Apr 11, 2019 at 1:16 AM Kees Cook <keescook@chromium.org> wrote:
> > diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
> > index 74271dba4f94..01874ef0f883 100644
> > --- a/scripts/gcc-plugins/Kconfig
> > +++ b/scripts/gcc-plugins/Kconfig
> > @@ -13,10 +13,11 @@ config HAVE_GCC_PLUGINS
> >           An arch should select this symbol if it supports building with
> >           GCC plugins.
> >
> > -menuconfig GCC_PLUGINS
> > -       bool "GCC plugins"
> > +config GCC_PLUGINS
> > +       bool
>
>
> This will flatten the plugin config options.
>
> If you want to keep the current menu structure, you can do:
>
> menu "GCC plugins"
> ...
> endmenu

Ah, excellent point. I'll fix this.

> Another side-effect is Kbuild will descend into scripts/gcc-plugins/
> even when no plugin is selected.
> It is not a big build speed regression, though.

I suspect the plugins Kconfig may disppear eventually with the options
spread around other Kconfigs (since now the plugin capability is known
at config time).

> > diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
> > new file mode 100644
> > index 000000000000..8223a8ab1a12
> > --- /dev/null
> > +++ b/security/Kconfig.hardening
> > @@ -0,0 +1,94 @@
> > +menu "Kernel hardening options"
> > +
> > +config GCC_PLUGIN_STRUCTLEAK
> > +       bool
> > +       depends on GCC_PLUGIN_STRUCTLEAK_USER || GCC_PLUGIN_STRUCTLEAK_BYREF || GCC_PLUGIN_STRUCTLEAK_BYREF_ALL
>
>
> I think this 'depends on' is unnecessary.

Okay, I'll drop it.

>
>
> > +menu "Memory initialization"
> > +
> > +choice
> > +       prompt "Initialize kernel stack variables at function entry"
> > +       depends on CC_HAS_AUTO_VAR_INIT || GCC_PLUGINS
>
> Nit:
> CC_HAS_AUTO_VAR_INIT does not exist at this point.
> I will be added by 3/3.

Oops, yes, I split this chunk in the wrong place. I will fix it.

Thanks!

-- 
Kees Cook
