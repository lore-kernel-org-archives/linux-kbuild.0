Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:33910 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbfHMBQh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Aug 2019 21:16:37 -0400
MIME-Version: 1.0
References: <20190509143859.9050-1-joe.lawrence@redhat.com>
 <20190509143859.9050-4-joe.lawrence@redhat.com> <CAK7LNAT3qZ8EESs0eEtaezjgjzRa1XqoAAxpKh_sLi_JPJie2A@mail.gmail.com>
 <CAK7LNAToLyKSk9C0hwuMRxDK8yjJtghi_y6fH1p0+wK7N1wKow@mail.gmail.com> <20190809184253.GA31811@redhat.com>
In-Reply-To: <20190809184253.GA31811@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 13 Aug 2019 10:15:47 +0900
Message-ID: <CAK7LNARHQY_7E2ar47EZJmh=SD_Mf3p51AcKAecVLQip27+3Ug@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] livepatch: Add klp-convert tool
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, live-patching@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sat, Aug 10, 2019 at 3:42 AM Joe Lawrence <joe.lawrence@redhat.com> wrote:

> > > > diff --git a/scripts/livepatch/Makefile b/scripts/livepatch/Makefile
> > > > new file mode 100644
> > > > index 000000000000..2842ecdba3fd
> > > > --- /dev/null
> > > > +++ b/scripts/livepatch/Makefile
> > > > @@ -0,0 +1,7 @@
> > > > +hostprogs-y                    := klp-convert
> > > > +always                         := $(hostprogs-y)
> > > > +
> > > > +klp-convert-objs               := klp-convert.o elf.o
> > > > +
> > > > +HOST_EXTRACFLAGS               := -g -I$(INSTALL_HDR_PATH)/include -Wall
> > >
> > > This looks strange.
> > >
> > > Theoretically, you cannot include headers in $(INSTALL_HDR_PATH)/include
> > > from host programs.
> > >
> > > headers_install works for the target architecture, not host architecture.
> > > This may cause a strange result when you are cross-compiling the kernel.
> > >
> > > BTW, which header in $(INSTALL_HDR_PATH)/include do you need to include ?
> > >
> > >
> > > Also, -Wall is redundant because it is set by the top-level Makefile.
> >
> >
> > I deleted HOST_EXTRACFLAGS entirely,
> > and I was still able to build klp-convert.
> >
> >
> > What is the purpose of '-g' ?
> > If it is only needed for local debugging,
> > it should be removed from the upstream code, in my opinion.
> >
>
> HOST_EXTRACFLAGS looks like it was present in the patchset from the
> early RFC days and inherited through each revision.
>
> These are the files that the klp-convert code includes, mostly typical C
> usercode headers like stdio.h and a few local headers like elf.h:
>
>   % grep -h '^#include' scripts/livepatch/*.{c,h} | sort -u
>   #include "elf.h"
>   #include <fcntl.h>
>   #include <gelf.h>
>   #include "klp-convert.h"
>   #include "list.h"
>   #include <stdbool.h>
>   #include <stdio.h>
>   #include <stdlib.h>
>   #include <string.h>
>   #include <sys/stat.h>
>   #include <sys/types.h>
>   #include <unistd.h>
>
> If HOST_EXTRACFLAGS is really unneeded, we can easily drop it in the
> next patchset version.

Yes, please do so.

Thanks.



-- 
Best Regards
Masahiro Yamada
