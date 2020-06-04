Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730118AbgFDRSW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jun 2020 13:18:22 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 222E0C08C5C0
        for <linux-kbuild@vger.kernel.org>; Thu,  4 Jun 2020 10:18:22 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id p5so6836266ile.6
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Jun 2020 10:18:22 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUU7AAzpYfktqCvn8oKpFMzZud6fQEh=fNWi4xkuqKmYog@mail.gmail.com>
 <635d02d6-05a9-7620-c386-dac766cd49da@linux.com> <CA+icZUUGgtsxw7UXDQYpouRuRhFWnfA3-XN7zp3OK7Yv2Ase+w@mail.gmail.com>
 <a9615332-f735-4c7a-0368-f3a0402f611b@linux.com> <CA+icZUVfXwVfouPpFeBR5=TxOAT6XWDnpjhPmxTMpajV8Rs-gw@mail.gmail.com>
In-Reply-To: <CA+icZUVfXwVfouPpFeBR5=TxOAT6XWDnpjhPmxTMpajV8Rs-gw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 4 Jun 2020 19:18:09 +0200
Message-ID: <CA+icZUUkYeYqBn9j2QEq2imBntc=2n52pCaqQyK2C4Vw_fv1rw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add variables for compression tools
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: efremov@linux.com
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Nick Terrell <terrelln@fb.com>

On Thu, Jun 4, 2020 at 7:05 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Thu, Jun 4, 2020 at 7:01 PM Denis Efremov <efremov@linux.com> wrote:
> >
> > >
> > > me and other people use "support for ZSTD-compressed kernel and
> > > initramfs" for a long time successfully.
> > >
> > > I have modified Debian's initramfs-tools package to support creating
> > > such an initrd.img and boot it successfully.
> > > See Debian Bug #955469.
> > >
> > > There is a pull-request sent out to integrate into Linus tree.
> > >
> > > Some numbers from Nick Terell in his pull-request:
> > > "
> > > The zstd compressed kernel is smaller than the gzip compressed kernel but larger
> > > than the xz or lzma compressed kernels, and it decompresses faster than
> > > everything except lz4. See the table below for the measurement of an x86_64
> > > kernel ordered by compressed size:
> > >
> > > algo size
> > > xz   6,509,792
> > > lzma 6,856,576
> > > zstd 7,399,157
> > > gzip 8,522,527
> > > bzip 8,629,603
> > > lzo 9,808,035
> > > lz4 10,705,570
> > > none 32,565,672
> > > "
> > >
> > > More numbers in [0].
> > >
> > > Hope this helps you to position the zstd algo.
> >
> > Well, I didn't know that it's already implemented.
> >
> > My patch simply adds variables like GZIP, BZIP2, etc to the top makefile.
> > Unfortunately there is no ZSTD in kernel now. Maybe it's in the linux-next?
> > I can't see it. If my patch will be accepted to the mainline then it will
> > be reasonable to add ZSTD var in makefiles as soon as zstd compression
> > will be merged.
> >
>
> No, it was not merged anywhere AFAICS.
>
> If you want to test please pull from [1].
> I am using it on top of Linux v5.7.
>
> - Sedat -
>
> [1] https://github.com/terrelln/linux/commits/zstd-v5

v5 series overview at patchwork:
https://lore.kernel.org/patchwork/project/lkml/list/?series=437934

v5 single mbox file (cleanly applied here):
https://lore.kernel.org/patchwork/series/437934/mbox/

- Sedat -
