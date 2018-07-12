Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:32138 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbeGLKXC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jul 2018 06:23:02 -0400
MIME-Version: 1.0
In-Reply-To: <20180710004602.21599-1-labbott@redhat.com>
References: <20180710004602.21599-1-labbott@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 12 Jul 2018 19:13:18 +0900
Message-ID: <CAK7LNAQ0dWqaYkLjevCuboCBovcsTV1cMh48qv__wwMZs-vAxg@mail.gmail.com>
Subject: Re: [PATCHv2 0/7] HOSTFLAGS and HOSTLDFLAGS from the environment
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robin Jarry <robin.jarry@6wind.com>, Jonathan Corbet <corbet@lwn.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>

2018-07-10 9:45 GMT+09:00 Laura Abbott <labbott@redhat.com>:
>
> Hi,
>
> This is v2 of the series to set HOSTCFLAGS and HOSTLDFLAGS from the
> environment. The changes are mostly minor fixups requested and also
> include documentation of the new options.



I checked this series.


I left minor comments for 3/7 and 7/7.

Unless you disagree,
I will fix them up locally
and queue it to my tree.

Thanks.




> Laura Abbott (7):
>   tools: build: Fixup host c flags
>   tools: build: Use HOSTLDFLAGS with fixdep
>   treewide: Rename HOSTCFLAGS -> KBUILD_HOSTCFLAGS
>   treewide: Rename HOSTCXXFLAGS to KBUILD_HOSTCXXFLAGS
>   treewide: Rename HOSTLDFLAGS to KBUILD_HOSTLDFLAGS
>   treewide: Rename HOST_LOADLIBES to KBUILD_HOSTLDLIBS
>   Kbuild: Use HOST*FLAGS options from the command line
>
>  Documentation/kbuild/kbuild.txt | 16 ++++++++++++++++
>  Makefile                        | 17 +++++++++--------
>  arch/alpha/boot/Makefile        |  2 +-
>  net/bpfilter/Makefile           |  4 ++--
>  samples/bpf/Makefile            | 22 +++++++++++-----------
>  samples/seccomp/Makefile        |  6 +++---
>  scripts/Kbuild.include          |  2 +-
>  scripts/Makefile                |  4 ++--
>  scripts/Makefile.host           | 24 ++++++++++++------------
>  scripts/kconfig/Makefile        | 10 +++++-----
>  tools/build/Build.include       |  2 +-
>  tools/build/Makefile            |  2 +-
>  tools/objtool/Makefile          |  4 ++--
>  tools/perf/pmu-events/Build     |  2 +-
>  14 files changed, 67 insertions(+), 50 deletions(-)
>
> --
> 2.17.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
