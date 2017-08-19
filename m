Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:53506 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751115AbdHSOyq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Aug 2017 10:54:46 -0400
Date: Sat, 19 Aug 2017 16:54:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: special handle of scripts/kconfig/zconf.tab.o
Message-ID: <20170819145441.GA5940@ravnborg.org>
References: <5992D4DF.2080405@cn.fujitsu.com>
 <CAK7LNATGwrMBsaps1oVOi_21R8jzTadeWSwaK1dA8nMaJs7KpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATGwrMBsaps1oVOi_21R8jzTadeWSwaK1dA8nMaJs7KpQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Cao jin <caoj.fnst@cn.fujitsu.com>, Michal Marek <mmarek@suse.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Masahiro

On Sat, Aug 19, 2017 at 09:42:40PM +0900, Masahiro Yamada wrote:
> Hi.
> (+CC Sam)
> 
> 2017-08-15 20:02 GMT+09:00 Cao jin <caoj.fnst@cn.fujitsu.com>:
> > Masahiro-san,
> >
> > I have a question about make *config. In scripts/kconfig/Makefile, there
> > is following statement:
> >
> > $(obj)/zconf.tab.o: $(obj)/zconf.lex.c $(obj)/zconf.hash.c
> >
> > and the $(obj)/zconf.{tab,hash,lex}.c match the rule in Makefile.lib:
> >
> > $(obj)/%: $(src)/%_shipped
> >         $(call cmd,shipped)
> >
> > and cmd_shipped just transform the _shipped file to .c via `cat`.
> >
> > And zconf.tab.c includes several *other* .c files which make the whole
> > process a little obscure, because there are not corresponding .o files
> > for the *other* .c files.
> >
> > My questions is: Does this special handling has other meanings that I
> > may miss? Or just legacy.
> 
> 
> This convention had existed before I joined the kernel development,
> so I am not sure about the historical background.
> 
> The following is my understanding.
> (I hope Sam and Michal will correct me if I am wrong.)
> 
> 
> The difference between with/without _shipped is,
> zconf.{tab,hash,lex}.c_shipped reside under $(srctree),
> whereas zconf.{tab,hash,lex}.c under $(objtree).

The whole idea behind the *_shipped file was to have less dependencies
on the host system buildign the kernel.
So we did not rely on users having all of flex, bison, gperf
installed in the right versions.

So this is all about less dependencies on the build host,
and we did not back then consider so much $(srctree) versus $(objtree).
I think that support for _shipped predates when we added support for
"make O=..." - but I may be wrong - did not check the history.

I recall we have had to updated support for _shipped a few times
due to some smaller issues, and maybe we never got around to actually
document this in Documentation/kbuild/

	Sam
