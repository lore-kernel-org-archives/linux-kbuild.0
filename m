Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:22887 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727875AbgC2LFD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 29 Mar 2020 07:05:03 -0400
MIME-Version: 1.0
References: <20200325031433.28223-1-masahiroy@kernel.org> <20200325031433.28223-2-masahiroy@kernel.org>
 <202003251906.973AD868@keescook>
In-Reply-To: <202003251906.973AD868@keescook>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 29 Mar 2020 20:04:14 +0900
Message-ID: <CAK7LNARRZ3_z6tjuGJ=PUw5JUtP5AM31wYpr0mnn9yq6VfzQOA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: add -Wall to KBUILD_HOSTCXXFLAGS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Kernel Hardening <kernel-hardening@lists.openwall.com>, Emese Revfy <re.emese@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Mar 26, 2020 at 11:06 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, Mar 25, 2020 at 12:14:32PM +0900, Masahiro Yamada wrote:
> > Add -Wall to catch more warnings for C++ host programs.
> >
> > When I submitted the previous version, the 0-day bot reported
> > -Wc++11-compat warnings for old GCC:
> >
> >   HOSTCXX -fPIC scripts/gcc-plugins/latent_entropy_plugin.o
> > In file included from /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/tm.h:28:0,
> >                  from scripts/gcc-plugins/gcc-common.h:15,
> >                  from scripts/gcc-plugins/latent_entropy_plugin.c:78:
> > /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/config/elfos.h:102:21: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
> >     fprintf ((FILE), "%s"HOST_WIDE_INT_PRINT_UNSIGNED"\n",\
> >                      ^
> > /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/config/elfos.h:170:24: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
> >        fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",  \
> >                         ^
> > In file included from /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/tm.h:42:0,
> >                  from scripts/gcc-plugins/gcc-common.h:15,
> >                  from scripts/gcc-plugins/latent_entropy_plugin.c:78:
> > /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/defaults.h:126:24: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
> >        fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",  \
> >                         ^
> >
> > The source of the warnings is in the plugin headers, so we have no
> > control of it. I just suppressed them by adding -Wno-c++11-compat to
> > scripts/gcc-plugins/Makefile.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Acked-by: Kees Cook <keescook@chromium.org>
>
> -Kees


Applied to linux-kbuild.



-- 
Best Regards
Masahiro Yamada
