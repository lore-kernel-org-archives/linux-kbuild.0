Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:42704 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725927AbeICN6T (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Sep 2018 09:58:19 -0400
Date: Mon, 3 Sep 2018 11:39:45 +0200
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v4 07/11] kbuild: use 'include' directive to load
 auto.conf from top Makefile
Message-ID: <20180903093945.GA1195@zn.tnic>
References: <1532072796-7947-1-git-send-email-yamada.masahiro@socionext.com>
 <1532072796-7947-8-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1532072796-7947-8-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Dirk Gouders <dirk@gouders.net>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Hey,

On Fri, Jul 20, 2018 at 04:46:32PM +0900, Masahiro Yamada wrote:
> When you build targets that require the kernel configuration, dot-config
> is set to 1, then the top-level Makefile includes auto.conf.  However,
> Make considers its inclusion is optional because the '-include' directive
> is used here.
> 
> If a necessary configuration file is missing for the external module
> building, the following error message is displayed:
> 
>   ERROR: Kernel configuration is invalid.
>          include/generated/autoconf.h or include/config/auto.conf are missing.
>          Run 'make oldconfig && make prepare' on kernel src to fix it.
> 
> However, Make still continues building; /bin/false let the creation of
> 'include/config/auto.config' fail, but Make can ignore the error since
> it is included by the '-include' directive.
> 
> I guess the reason of using '-include' directive was to suppress
> the warning when you build the kernel from a pristine source tree:
> 
>   Makefile:605: include/config/auto.conf: No such file or directory
> 
> The previous commit made sure include/config/auto.conf exists after
> the 'make *config' stage.  Now, we can use the 'include' directive
> without showing the warning.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v4: None
> 
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This complains here:

[boris@zn: ~/kernel/linux> git clean -dqfx
[boris@zn: ~/kernel/linux> cp ../configs/config-4.19-rc1 .config
'../configs/config-4.19-rc1' -> '.config'
[boris@zn: ~/kernel/linux> make
Makefile:605: include/config/auto.conf: No such file or directory

I guess because I'm skipping the "make oldconfig" step but that should
not be necessary since it should do oldconfig automatically before
building...

It still works - it is just the warning that is new.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
