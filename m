Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:47513 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbeKROez (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Nov 2018 09:34:55 -0500
MIME-Version: 1.0
References: <1541404309-30210-1-git-send-email-yamada.masahiro@socionext.com> <17334806.ITFQqvuZkQ@avalon>
In-Reply-To: <17334806.ITFQqvuZkQ@avalon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 18 Nov 2018 13:15:16 +0900
Message-ID: <CAK7LNAQ=Mj+P46=Y2uMr0AiP9nohoRWbKA5kdvL+domZQncBYA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rpm-pkg: fix binrpm-pkg breakage when O= is used
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, zhenzhong.duan@oracle.com, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Laurent,

On Sun, Nov 18, 2018 at 4:22 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Yamada-san,
>
> On Monday, 5 November 2018 09:51:49 EET Masahiro Yamada wrote:
> > Zhenzhong Duan reported that running 'make O=/build/kernel binrpm-pkg'
> > failed with the following errors:
> >
> >   Running 'make O=/build/kernel binrpm-pkg' failed with below two errors.
> >
> >   Makefile:600: include/config/auto.conf: No such file or directory
> >
> >   + cp make -C /mnt/root/kernel O=/build/kernel image_name make -f
> >   /mnt/root/kernel/Makefile ...
> >   cp: invalid option -- 'C'
> >   Try 'cp --help' for more information.
> >
> > Prior to commit 80463f1b7bf9 ("kbuild: add --include-dir flag only
> > for out-of-tree build"), both objtree and srctree were added to
> > --include-dir, and the wrong code 'make image_name' was working
> > relying on that. Now, the potential issue that had previously been
> > hidden just showed up.
> >
> > 'make image_name' recurses to the generated $(objtree)/Makefile and
> > ends up with running in srctree, which is incorrect. It should be
> > invoked with '-f $srctree/Makefile' (or KBUILD_SRC=) to be executed
> > in objtree.
>
> I (painfully) found out that a similar problem occurs with 'make bindeb-pkg'.
>
> After spending half a day unsuccessfully trying to debug and fix the problem I
> ran across this patch. The naive approach of mimicking the solution and adding
> 'MAKE="$MAKE -f $srctree/Makefile"' at the top of scripts/package/builddeb
> didn't work. Reverting commit 80463f1b7bf9 fixed the problem.
>
> Would you be able to give it a look ? I'm afraid my limited skills related to
> the kernel build system don't allow me to submit a fix :-S

I fixed bindeb-pkg as well for v4.20-rc2

commit 02826a6ba301b72461c3706e1cc66d5571cd327e
Author: Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon Nov 5 16:52:34 2018 +0900

    kbuild: deb-pkg: fix bindeb-pkg breakage when O= is used


If you still see a problem, please let me know.



-- 
Best Regards
Masahiro Yamada
