Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:16891 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726785AbfHVDgg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Aug 2019 23:36:36 -0400
MIME-Version: 1.0
References: <20190509143859.9050-1-joe.lawrence@redhat.com>
 <20190509143859.9050-7-joe.lawrence@redhat.com> <CAK7LNAQuS-YcXecfJ21BGzc0CimzWxQcYST5-1xRgnCQGtcL4A@mail.gmail.com>
 <20190812155626.GA19845@redhat.com> <CAK7LNATRLTBqA9c=b+Y38T-zWc9o5JMq18r9auA=enPC=p10pA@mail.gmail.com>
 <alpine.LSU.2.21.1908161016430.2020@pobox.suse.cz> <6c7e4d19-b993-1c14-d6cf-6aa1ee891361@redhat.com>
 <CAK7LNAS0Z95VT2n1o3V09bKf-rkPBMNdRryF67gpLKtnjAVAiA@mail.gmail.com>
 <alpine.LSU.2.21.1908190928520.31051@pobox.suse.cz> <42254ffc-6422-19e1-62a2-6abc23fd089a@redhat.com>
In-Reply-To: <42254ffc-6422-19e1-62a2-6abc23fd089a@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 22 Aug 2019 12:35:54 +0900
Message-ID: <CAK7LNAS=yCP=me5_qc_yxjeQPvRtbHwp3CAe8-w6KE6P0+VS_w@mail.gmail.com>
Subject: Re: [PATCH v4 06/10] modpost: Add modinfo flag to livepatch modules
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: Miroslav Benes <mbenes@suse.cz>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, live-patching@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Joe,

On Tue, Aug 20, 2019 at 1:02 AM Joe Lawrence <joe.lawrence@redhat.com> wrote:
>
> On 8/19/19 3:31 AM, Miroslav Benes wrote:
> > On Mon, 19 Aug 2019, Masahiro Yamada wrote:
> >
> >>
> >> I can review this series from the build system point of view,
> >> but I am not familiar enough with live-patching itself.
> >>
> >> Some possibilities:
> >>
> >> [1] Merge this series thru the live-patch tree after the
> >>      kbuild base patches land.
> >>      This requires one extra development cycle (targeting for 5.5-rc1)
> >>      but I think this is the official way if you do not rush into it.
> >
> > I'd prefer this option. There is no real rush and I think we can wait one
> > extra development cycle.
>
> Agreed.  I'm in no hurry and was only curious about the kbuild changes
> that this patchset is now dependent on -- how to note them for other
> reviewers or anyone wishing to test.
>
> > Joe, could you submit one more revision with all the recent changes (once
> > kbuild improvements settle down), please? We should take a look at the
> > whole thing one more time? What do you think?
> >
>
> Definitely, yes.  I occasionally force a push to:
> https://github.com/joe-lawrence/linux/tree/klp-convert-v5-expanded
>
> as I've been updating and collecting feedback from v4.  Once updates
> settle, I'll send out a new v5 set.
>
> -- Joe

When you send v5, please squash the following clean-up too:



diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 89eaef0d3efc..9e77246d84e3 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -47,7 +47,7 @@ targets += $(modules) $(modules:.ko=.mod.o)
 # Live Patch
 # ---------------------------------------------------------------------------

-$(modules-klp:.ko=.tmp.ko): %.tmp.ko: %.o %.mod.o Symbols.list FORCE
+%.tmp.ko: %.o %.mod.o Symbols.list FORCE
        +$(call if_changed,ld_ko_o)

 quiet_cmd_klp_convert = KLP     $@




Thanks.


-- 
Best Regards
Masahiro Yamada
