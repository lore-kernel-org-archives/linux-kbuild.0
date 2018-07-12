Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:64331 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbeGLKVF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jul 2018 06:21:05 -0400
MIME-Version: 1.0
In-Reply-To: <20180710004602.21599-8-labbott@redhat.com>
References: <20180710004602.21599-1-labbott@redhat.com> <20180710004602.21599-8-labbott@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 12 Jul 2018 19:11:17 +0900
Message-ID: <CAK7LNATjYXn8z-FbVLO-ZPGQUQSiX0YD_hCOPhcWSdoc2T5JhA@mail.gmail.com>
Subject: Re: [PATCHv2 7/7] Kbuild: Use HOST*FLAGS options from the command line
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robin Jarry <robin.jarry@6wind.com>, Jonathan Corbet <corbet@lwn.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>

2018-07-10 9:46 GMT+09:00 Laura Abbott <labbott@redhat.com>:
>
> Now that we have the rename in place, reuse the HOST*FLAGS options as
> something that can be set from the command line and included with the
> rest of the flags.
>
> Signed-off-by: Laura Abbott <labbott@redhat.com>
> ---
> v2: Use the correct name for HOSTLDLIBS, update documentation.
> ---
>  Documentation/kbuild/kbuild.txt | 16 ++++++++++++++++
>  Makefile                        |  9 +++++----
>  2 files changed, 21 insertions(+), 4 deletions(-)
>




> +HOSTLDFLAGS
> +--------------------------------------------------
> +Additional flags to be passed to $(HOSTLD) when building host programs.



Strictly speaking, $(CC) or $(CXX) is used
when linking host programs.


See this.
https://github.com/torvalds/linux/blob/v4.17/scripts/Makefile.host#L95
https://github.com/torvalds/linux/blob/v4.17/scripts/Makefile.host#L112


In fact, there is no definition of 'HOSTLD' in the top Makefile.


I will reword it to:


HOSTLDFLAGS
--------------------------------------------------
Additional flags to be passed when linking host programs.




I will also move this hunk up
after LDFLAGS_MODULE.





-- 
Best Regards
Masahiro Yamada
