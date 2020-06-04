Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbgFDNF1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jun 2020 09:05:27 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BB7EC08C5C0
        for <linux-kbuild@vger.kernel.org>; Thu,  4 Jun 2020 06:05:26 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id t8so5953088ilm.7
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Jun 2020 06:05:26 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 4 Jun 2020 15:05:14 +0200
Message-ID: <CA+icZUU7AAzpYfktqCvn8oKpFMzZud6fQEh=fNWi4xkuqKmYog@mail.gmail.com>
Subject: [PATCH] kbuild: add variables for compression tools
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Denis Efremov <efremov@linux.com>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>

Hi Denis,

is it possible to add ZSTD compression support with the possibility to
add - for example multithreading - options?

Quote from your patch:

> As a sidenote, for multi-threaded lzma, xz compression one can use:
> $ export XZ_OPT=3D"--threads=3D0"

man zstd says:

       -T#, --threads=3D#
              Compress using # working threads (default: 1). If # is
0, attempt to detect and use the number of physical CPU cores. In all
cases, the nb  of  threads  is  capped  to  ZST=E2=80=90
              DMT_NBTHREADS_MAX=3D=3D200. This modifier does nothing if
zstd is compiled without multithread support.

Of course, I can help with testing.

For the documentation - which I have not checked - are the tools and
libs mentioned you will need to have installed for certain compression
tools?
For ZSTD on Debian - these are zstd and libzstd1:amd64 packages.

Thanks.

Regards,
- Sedat -


[1] https://patchwork.kernel.org/patch/11585381/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.=
git/commit/?h=3Dkbuild&id=3D1312a1e434c1816e3bbcd4f806aa862dc735dec0
