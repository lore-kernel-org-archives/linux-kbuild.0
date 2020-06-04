Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38412 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728679AbgFDNzH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jun 2020 09:55:07 -0400
Received: by mail-lf1-f66.google.com with SMTP id 202so3657918lfe.5
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Jun 2020 06:55:06 -0700 (PDT)
Reply-To: efremov@linux.com
References: <CA+icZUU7AAzpYfktqCvn8oKpFMzZud6fQEh=fNWi4xkuqKmYog@mail.gmail.com>
From: Denis Efremov <efremov@linux.com>
Subject: Re: [PATCH] kbuild: add variables for compression tools
Message-ID: <635d02d6-05a9-7620-c386-dac766cd49da@linux.com>
Date: Thu, 4 Jun 2020 16:55:03 +0300
MIME-Version: 1.0
In-Reply-To: <CA+icZUU7AAzpYfktqCvn8oKpFMzZud6fQEh=fNWi4xkuqKmYog@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>

Hi,

On 6/4/20 4:05 PM, Sedat Dilek wrote:
> Hi Denis,
> 
> is it possible to add ZSTD compression support with the possibility to
> add - for example multithreading - options?

Where do you want to use zstd in kernel?

For example, to compress headers xz is used, to compress /proc/config.gz
gzip is used. It could be relatively easy patched to use zstd for it and
it could be easy to add tarzstd-pkg target for building the kernel
as a zstd compressed tarball. However, I doubt that someone really needs it.
xz is best for headers because of compression ratio, gzip is best for config
because gzip is installed by default on most systems.
To compress modules, ramdisk or kernel image with zstd one needs
to implement zstd decompression algorithm in kernel. Given that there
are already gzip,bzip2,lzma,xz,lzo,lz4 I really doubt that it will be
useful. There should be a good comparison showing that kernel image
with zstd, for example, beats gzip and couple of others in comression ratio
and decompression speed to properly position the zstd algo.

> For the documentation - which I have not checked - are the tools and
> libs mentioned you will need to have installed for certain compression
> tools?

gzip, bzip2 are already installed on most systems. It's highly likely that
lzo, lzma, xz will require you to install them.

Thanks,
Denis
