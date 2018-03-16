Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:41437 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751791AbeCPBkm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Mar 2018 21:40:42 -0400
Received: by mail-qk0-f195.google.com with SMTP id s78so9486644qkl.8
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Mar 2018 18:40:42 -0700 (PDT)
Date: Thu, 15 Mar 2018 21:40:40 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: Intermittent build failure with TRIM_UNUSED_KSYMS and related
 problems
In-Reply-To: <CAK7LNAR8Z1H9+wcMt4nMkrBU9K4=sTZQFi5p26N1rPR_LtJVJQ@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.76.1803152133000.28583@knanqh.ubzr>
References: <ccedea72-0e61-500c-86e5-976ecb5cefb5@gmail.com> <CAK7LNAS9rOhyEdSUBbhPVW572437w5g7zLqMGSHn4gg3nbCU_g@mail.gmail.com> <nycvar.YSQ.7.76.1803121331280.28583@knanqh.ubzr> <4bbfeb74-c912-74e5-4f4d-287ec7ad065d@gmail.com> <nycvar.YSQ.7.76.1803131922060.28583@knanqh.ubzr>
 <4aee7e23-ac36-9495-14a9-471379a7896b@gmail.com> <nycvar.YSQ.7.76.1803151504080.28583@knanqh.ubzr> <CAK7LNAR8Z1H9+wcMt4nMkrBU9K4=sTZQFi5p26N1rPR_LtJVJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Thomas Lindroth <thomas.lindroth@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Fri, 16 Mar 2018, Masahiro Yamada wrote:

> 2018-03-16 5:56 GMT+09:00 Nicolas Pitre <nicolas.pitre@linaro.org>:
> > ----- >8
> > Subject: [PATCH] kbuild: make scripts/adjust_autoksyms.sh robust against timestamp races
> >
> > Some filesystems have timestamps with coarse precision that may allow
> > for a recently built object file to have the same timestamp as the
> > updated time on one of its dependency files. When that happens, the
> > object file doesn't get rebuilt as it should.
> >
> > This is especially the case on filesystems that don't have sub-second
> > time precision, such as ext3 or Ext4 with 128B inodes.
> >
> > Let's prevent that by making sure updated dependency files have a newer
> > timestamp than the first file we created (i.e. autoksyms.h.tmpnew).
> >
> > Reported-by: Thomas Lindroth <thomas.lindroth@gmail.com>
> > Signed-off-by: Nicolas Pitre <nico@linaro.org>
> >
> > diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> > index 513da1a4a2..d67830e6e3 100755
> > --- a/scripts/adjust_autoksyms.sh
> > +++ b/scripts/adjust_autoksyms.sh
> > @@ -84,6 +84,13 @@ while read sympath; do
> >         depfile="include/config/ksym/${sympath}.h"
> >         mkdir -p "$(dirname "$depfile")"
> >         touch "$depfile"
> 
> Just a nit.
> 
> I think this 'touch' is unnecessary.
> If $depfile does not exist, the '-nt' is evaluated to false,
> so it will be touched inside the while loop anyway.

Though it is more efficient with the first touch up front, as the common 
case requires only 2 stat system calls instead of 4.

> > +       # Filesystems with coarse time precision may create timestamps
> > +       # equal to the one from a file that was very recently built and that
> > +       # needs to be rebuild. Let's guard against that by making sure our
> > +       # dep files are always newer than the first file we created here.
> > +       while [ ! "$depfile" -nt "$new_ksyms_file" ]; do
> > +               touch "$depfile"
> > +       done
> >         echo $((count += 1))
> >  done | tail -1 )
> >  changed=${changed:-0}
> > ----- >8
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
> 
