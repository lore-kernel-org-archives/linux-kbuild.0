Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbgFDQII (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jun 2020 12:08:08 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C95F7C08C5C0
        for <linux-kbuild@vger.kernel.org>; Thu,  4 Jun 2020 09:08:08 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id r2so6955766ioo.4
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Jun 2020 09:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUU7AAzpYfktqCvn8oKpFMzZud6fQEh=fNWi4xkuqKmYog@mail.gmail.com>
 <635d02d6-05a9-7620-c386-dac766cd49da@linux.com>
In-Reply-To: <635d02d6-05a9-7620-c386-dac766cd49da@linux.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 4 Jun 2020 18:07:56 +0200
Message-ID: <CA+icZUUGgtsxw7UXDQYpouRuRhFWnfA3-XN7zp3OK7Yv2Ase+w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add variables for compression tools
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: efremov@linux.com
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Nick Terrell <terrelln@fb.com>

On Thu, Jun 4, 2020 at 3:55 PM Denis Efremov <efremov@linux.com> wrote:
>
> Hi,
>
> On 6/4/20 4:05 PM, Sedat Dilek wrote:
> > Hi Denis,
> >
> > is it possible to add ZSTD compression support with the possibility to
> > add - for example multithreading - options?
>
> Where do you want to use zstd in kernel?
>
> For example, to compress headers xz is used, to compress /proc/config.gz
> gzip is used. It could be relatively easy patched to use zstd for it and
> it could be easy to add tarzstd-pkg target for building the kernel
> as a zstd compressed tarball. However, I doubt that someone really needs it.
> xz is best for headers because of compression ratio, gzip is best for config
> because gzip is installed by default on most systems.
> To compress modules, ramdisk or kernel image with zstd one needs
> to implement zstd decompression algorithm in kernel. Given that there
> are already gzip,bzip2,lzma,xz,lzo,lz4 I really doubt that it will be
> useful. There should be a good comparison showing that kernel image
> with zstd, for example, beats gzip and couple of others in comression ratio
> and decompression speed to properly position the zstd algo.
>

[ CC Nick ]

Hi,

me and other people use "support for ZSTD-compressed kernel and
initramfs" for a long time successfully.

I have modified Debian's initramfs-tools package to support creating
such an initrd.img and boot it successfully.
See Debian Bug #955469.

There is a pull-request sent out to integrate into Linus tree.

Some numbers from Nick Terell in his pull-request:
"
The zstd compressed kernel is smaller than the gzip compressed kernel but larger
than the xz or lzma compressed kernels, and it decompresses faster than
everything except lz4. See the table below for the measurement of an x86_64
kernel ordered by compressed size:

algo size
xz   6,509,792
lzma 6,856,576
zstd 7,399,157
gzip 8,522,527
bzip 8,629,603
lzo 9,808,035
lz4 10,705,570
none 32,565,672
"

More numbers in [0].

Hope this helps you to position the zstd algo.

Maybe, Nick can give you some more details.

Thanks.

Regards,
- Sedat -

[0] https://lwn.net/Articles/817134/
[1] https://github.com/terrelln/linux/commits/zstd-v5
[2] https://lkml.org/lkml/2020/6/1/1590
[3] https://bugs.debian.org/955469

> > For the documentation - which I have not checked - are the tools and
> > libs mentioned you will need to have installed for certain compression
> > tools?
>
> gzip, bzip2 are already installed on most systems. It's highly likely that
> lzo, lzma, xz will require you to install them.
>
> Thanks,
> Denis
