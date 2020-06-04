Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729994AbgFDRF2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jun 2020 13:05:28 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5AAFC08C5C0
        for <linux-kbuild@vger.kernel.org>; Thu,  4 Jun 2020 10:05:28 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id y5so7112842iob.12
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Jun 2020 10:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUU7AAzpYfktqCvn8oKpFMzZud6fQEh=fNWi4xkuqKmYog@mail.gmail.com>
 <635d02d6-05a9-7620-c386-dac766cd49da@linux.com> <CA+icZUUGgtsxw7UXDQYpouRuRhFWnfA3-XN7zp3OK7Yv2Ase+w@mail.gmail.com>
 <a9615332-f735-4c7a-0368-f3a0402f611b@linux.com>
In-Reply-To: <a9615332-f735-4c7a-0368-f3a0402f611b@linux.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 4 Jun 2020 19:05:16 +0200
Message-ID: <CA+icZUVfXwVfouPpFeBR5=TxOAT6XWDnpjhPmxTMpajV8Rs-gw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add variables for compression tools
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: efremov@linux.com
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Nick Terrell <terrelln@fb.com>

On Thu, Jun 4, 2020 at 7:01 PM Denis Efremov <efremov@linux.com> wrote:
>
> >
> > me and other people use "support for ZSTD-compressed kernel and
> > initramfs" for a long time successfully.
> >
> > I have modified Debian's initramfs-tools package to support creating
> > such an initrd.img and boot it successfully.
> > See Debian Bug #955469.
> >
> > There is a pull-request sent out to integrate into Linus tree.
> >
> > Some numbers from Nick Terell in his pull-request:
> > "
> > The zstd compressed kernel is smaller than the gzip compressed kernel but larger
> > than the xz or lzma compressed kernels, and it decompresses faster than
> > everything except lz4. See the table below for the measurement of an x86_64
> > kernel ordered by compressed size:
> >
> > algo size
> > xz   6,509,792
> > lzma 6,856,576
> > zstd 7,399,157
> > gzip 8,522,527
> > bzip 8,629,603
> > lzo 9,808,035
> > lz4 10,705,570
> > none 32,565,672
> > "
> >
> > More numbers in [0].
> >
> > Hope this helps you to position the zstd algo.
>
> Well, I didn't know that it's already implemented.
>
> My patch simply adds variables like GZIP, BZIP2, etc to the top makefile.
> Unfortunately there is no ZSTD in kernel now. Maybe it's in the linux-next?
> I can't see it. If my patch will be accepted to the mainline then it will
> be reasonable to add ZSTD var in makefiles as soon as zstd compression
> will be merged.
>

No, it was not merged anywhere AFAICS.

If you want to test please pull from [1].
I am using it on top of Linux v5.7.

- Sedat -

[1] https://github.com/terrelln/linux/commits/zstd-v5
