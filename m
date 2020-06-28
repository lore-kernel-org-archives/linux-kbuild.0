Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:19303 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbgF1GAu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 02:00:50 -0400
MIME-Version: 1.0
References: <20200213122410.1605-1-masahiroy@kernel.org> <202002251057.C4E397A@keescook>
In-Reply-To: <202002251057.C4E397A@keescook>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 28 Jun 2020 14:59:47 +0900
Message-ID: <CAK7LNASw0YT8_itaa0OeZi8toV1TUj6EKCMbg6rchdYub0cgww@mail.gmail.com>
Subject: Re: [PATCH] gcc-plugins: fix gcc-plugins directory path in documentation
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Emese Revfy <re.emese@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Kernel Hardening <kernel-hardening@lists.openwall.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Feb 26, 2020 at 3:58 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Feb 13, 2020 at 09:24:10PM +0900, Masahiro Yamada wrote:
> > Fix typos "plgins" -> "plugins".
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Thanks!
>
> Acked-by: Kees Cook <keescook@chromium.org>
>
> Jon, can you take this?

I noticed this patch had fallen into a crack.

Applied to linux-kbuild now.
Thanks.





> -Kees
>
> > ---
> >
> >  Documentation/kbuild/reproducible-builds.rst | 2 +-
> >  scripts/gcc-plugins/Kconfig                  | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/kbuild/reproducible-builds.rst b/Documentation/kbuild/reproducible-builds.rst
> > index 503393854e2e..3b25655e441b 100644
> > --- a/Documentation/kbuild/reproducible-builds.rst
> > +++ b/Documentation/kbuild/reproducible-builds.rst
> > @@ -101,7 +101,7 @@ Structure randomisation
> >
> >  If you enable ``CONFIG_GCC_PLUGIN_RANDSTRUCT``, you will need to
> >  pre-generate the random seed in
> > -``scripts/gcc-plgins/randomize_layout_seed.h`` so the same value
> > +``scripts/gcc-plugins/randomize_layout_seed.h`` so the same value
> >  is used in rebuilds.
> >
> >  Debug info conflicts
> > diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
> > index e3569543bdac..7b63c819610c 100644
> > --- a/scripts/gcc-plugins/Kconfig
> > +++ b/scripts/gcc-plugins/Kconfig
> > @@ -86,7 +86,7 @@ config GCC_PLUGIN_RANDSTRUCT
> >         source tree isn't cleaned after kernel installation).
> >
> >         The seed used for compilation is located at
> > -       scripts/gcc-plgins/randomize_layout_seed.h.  It remains after
> > +       scripts/gcc-plugins/randomize_layout_seed.h.  It remains after
> >         a make clean to allow for external modules to be compiled with
> >         the existing seed and will be removed by a make mrproper or
> >         make distclean.
> > --
> > 2.17.1
> >
>
> --
> Kees Cook



--
Best Regards

Masahiro Yamada
