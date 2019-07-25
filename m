Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:57721 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbfGYPt6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jul 2019 11:49:58 -0400
MIME-Version: 1.0
References: <20190717061800.10018-1-yamada.masahiro@socionext.com>
 <20190717061800.10018-8-yamada.masahiro@socionext.com> <230d2ca1-19cd-b60e-1b1b-6d7413eea9e2@siemens.com>
 <CAK7LNARu--p-tiJA2RGM5_KSQPSeo6-pkp-4GRd2AwM_1dtD7Q@mail.gmail.com> <0ee802e1-5563-3615-d08f-c936d4e96ebc@siemens.com>
In-Reply-To: <0ee802e1-5563-3615-d08f-c936d4e96ebc@siemens.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 26 Jul 2019 00:49:16 +0900
Message-ID: <CAK7LNATAD8hJUE559+LUf=OQ1-doMUtx7-Dv+B6ao5BK2667xg@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] kbuild: modpost: read modules.order instead of $(MODVERDIR)/*.mod
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Joe Lawrence <joe.lawrence@redhat.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Jul 26, 2019 at 12:27 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 25.07.19 17:18, Masahiro Yamada wrote:
> > Hi Jan,
> >
> > On Thu, Jul 25, 2019 at 5:39 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>
> >>
> >> This affects also external modules builds: I have patterns here that do
> >>
> >> [Makefile]
> >> subdir-y := some-module
> >>
> >> [some-module/Makefile]
> >> obj-m := some-module.o
> >>
> >> and since this patch, the final some-module.ko is no longer built. Am I missing
> >> something in the kbuild makefiles, or is this a regression?
> >
> > Thanks for the report.
> > Interesting. I have never imagined that Makefiles were written like that.
> >
> > I just wrote a fix-up, but I have not determined to apply it.
> > https://patchwork.kernel.org/patch/11059033/
> >
> > It is easy to fixup your Makefile, though.
>
> Thanks for addressing this quickly! I'm happy to adjust our code [1]. Is the
> suggested pattern usable with recent stable kernels as well, say down to 4.4 at
> least?

Yes, should work for any kernel version.



> Jan
>
> [1] https://github.com/siemens/jailhouse/blob/master/Kbuild#L54

Maybe,

obj-m := driver/ hypervisor/ configs/ inmates/ tools/

   and

$(patsubst %/,$(obj)/%,$(obj-m)): $(GEN_CONFIG_MK)


Not tested at all.


-- 
Best Regards
Masahiro Yamada
