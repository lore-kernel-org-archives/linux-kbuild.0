Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f175.google.com ([209.85.220.175]:33805 "EHLO
        mail-qk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751343AbeCUBHh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Mar 2018 21:07:37 -0400
Received: by mail-qk0-f175.google.com with SMTP id z184so3852557qkc.1
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Mar 2018 18:07:37 -0700 (PDT)
Date: Wed, 21 Mar 2018 09:07:35 +0800 (HKT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: Intermittent build failure with TRIM_UNUSED_KSYMS and related
 problems
In-Reply-To: <6a32ecdf-f25a-ca2f-6c10-52d4cc56cc6f@gmail.com>
Message-ID: <nycvar.YSQ.7.76.1803210900410.7132@knanqh.ubzr>
References: <ccedea72-0e61-500c-86e5-976ecb5cefb5@gmail.com> <CAK7LNAS9rOhyEdSUBbhPVW572437w5g7zLqMGSHn4gg3nbCU_g@mail.gmail.com> <nycvar.YSQ.7.76.1803121331280.28583@knanqh.ubzr> <4bbfeb74-c912-74e5-4f4d-287ec7ad065d@gmail.com> <nycvar.YSQ.7.76.1803131922060.28583@knanqh.ubzr>
 <4aee7e23-ac36-9495-14a9-471379a7896b@gmail.com> <nycvar.YSQ.7.76.1803151504080.28583@knanqh.ubzr> <CAK7LNARdit6ddTBVuf425VSeTQF3v3mR5tSBJ7La2VZFSNC-yw@mail.gmail.com> <6a32ecdf-f25a-ca2f-6c10-52d4cc56cc6f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Lindroth <thomas.lindroth@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, 20 Mar 2018, Thomas Lindroth wrote:

> On 03/20/2018 04:16 PM, Masahiro Yamada wrote:
> >> Some filesystems have timestamps with coarse precision that may allow
> >> for a recently built object file to have the same timestamp as the
> >> updated time on one of its dependency files. When that happens, the
> >> object file doesn't get rebuilt as it should.
> >>
> >> This is especially the case on filesystems that don't have sub-second
> >> time precision, such as ext3 or Ext4 with 128B inodes.
> >>
> >> Let's prevent that by making sure updated dependency files have a newer
> >> timestamp than the first file we created (i.e. autoksyms.h.tmpnew).
> >>
> >> Reported-by: Thomas Lindroth <thomas.lindroth@gmail.com>
> >> Signed-off-by: Nicolas Pitre <nico@linaro.org>
> >>
> >> diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> >> index 513da1a4a2..d67830e6e3 100755
> >> --- a/scripts/adjust_autoksyms.sh
> >> +++ b/scripts/adjust_autoksyms.sh
> >> @@ -84,6 +84,13 @@ while read sympath; do
> >>         depfile="include/config/ksym/${sympath}.h"
> >>         mkdir -p "$(dirname "$depfile")"
> >>         touch "$depfile"
> >> +       # Filesystems with coarse time precision may create timestamps
> >> +       # equal to the one from a file that was very recently built and that
> >> +       # needs to be rebuild. Let's guard against that by making sure our
> >> +       # dep files are always newer than the first file we created here.
> >> +       while [ ! "$depfile" -nt "$new_ksyms_file" ]; do
> >> +               touch "$depfile"
> >> +       done
> >>         echo $((count += 1))
> >>  done | tail -1 )
> >>  changed=${changed:-0}
> > 
> > 
> > Does this patch solve your problem?
> > I guess so, but I want you to test it just in case.
> 
> Yes, it solves the build problem but I'm still experiencing the original
> problem with vfio forwarded pci device even with this patch.

All this patch pretends to do is fix the build race issue.
So it should probably be applied for that reason alone.

> The problem is the same as before. A kvm based VM fails to initialize
> a pci device assigned using vfio if TRIM_UNUSED_KSYMS is on but works
> fine with it off.
> 
> I don't feel like spending time debugging that problem myself.
> TRIM_UNUSED_KSYMS sounded useful at first but the build time increased
> so much I probably won't use it anyway. If you manage to figure out
> what the problem is I'm willing to test patches.

If you could give me simple step by step reproduction instructions for 
the issue then I'll have a look.


Nicolas
