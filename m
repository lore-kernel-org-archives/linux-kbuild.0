Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44122 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729115AbgFDRBi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jun 2020 13:01:38 -0400
Received: by mail-lj1-f193.google.com with SMTP id c17so8187147lji.11
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Jun 2020 10:01:36 -0700 (PDT)
Reply-To: efremov@linux.com
References: <CA+icZUU7AAzpYfktqCvn8oKpFMzZud6fQEh=fNWi4xkuqKmYog@mail.gmail.com>
 <635d02d6-05a9-7620-c386-dac766cd49da@linux.com>
 <CA+icZUUGgtsxw7UXDQYpouRuRhFWnfA3-XN7zp3OK7Yv2Ase+w@mail.gmail.com>
From: Denis Efremov <efremov@linux.com>
Subject: Re: [PATCH] kbuild: add variables for compression tools
Message-ID: <a9615332-f735-4c7a-0368-f3a0402f611b@linux.com>
Date: Thu, 4 Jun 2020 20:01:33 +0300
MIME-Version: 1.0
In-Reply-To: <CA+icZUUGgtsxw7UXDQYpouRuRhFWnfA3-XN7zp3OK7Yv2Ase+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Nick Terrell <terrelln@fb.com>

> 
> me and other people use "support for ZSTD-compressed kernel and
> initramfs" for a long time successfully.
> 
> I have modified Debian's initramfs-tools package to support creating
> such an initrd.img and boot it successfully.
> See Debian Bug #955469.
> 
> There is a pull-request sent out to integrate into Linus tree.
> 
> Some numbers from Nick Terell in his pull-request:
> "
> The zstd compressed kernel is smaller than the gzip compressed kernel but larger
> than the xz or lzma compressed kernels, and it decompresses faster than
> everything except lz4. See the table below for the measurement of an x86_64
> kernel ordered by compressed size:
> 
> algo size
> xz   6,509,792
> lzma 6,856,576
> zstd 7,399,157
> gzip 8,522,527
> bzip 8,629,603
> lzo 9,808,035
> lz4 10,705,570
> none 32,565,672
> "
> 
> More numbers in [0].
> 
> Hope this helps you to position the zstd algo.

Well, I didn't know that it's already implemented.

My patch simply adds variables like GZIP, BZIP2, etc to the top makefile.
Unfortunately there is no ZSTD in kernel now. Maybe it's in the linux-next?
I can't see it. If my patch will be accepted to the mainline then it will
be reasonable to add ZSTD var in makefiles as soon as zstd compression
will be merged.

Thanks,
Denis
