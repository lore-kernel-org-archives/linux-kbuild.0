Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34841 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751452AbdB1V6l (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Feb 2017 16:58:41 -0500
MIME-Version: 1.0
In-Reply-To: <CAE40pdenVkk-JerdB905nyupoDDPiQk9qv4p1Jv62kcj3-dKhQ@mail.gmail.com>
References: <20161216105634.235457-1-arnd@arndb.de> <20161216105634.235457-12-arnd@arndb.de>
 <CAE40pdenVkk-JerdB905nyupoDDPiQk9qv4p1Jv62kcj3-dKhQ@mail.gmail.com>
From: Brendan Gregg <brendan.d.gregg@gmail.com>
Date: Tue, 28 Feb 2017 13:53:10 -0800
Message-ID: <CAE40pde6EcxiJtD627FVxRzjPADWXv2L7v8K2uUPvzmhC4JPYg@mail.gmail.com>
Subject: Re: [PATCH 11/13] fs: fix unsigned enum warning with gcc-4.2
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@vger.kernel.org, Russell King <rmk+kernel@armlinux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, kernel-build-reports@lists.linaro.org, kvmarm@lists.cs.columbia.edu

On Tue, Jan 3, 2017 at 2:47 PM, Brendan Gregg <brendan.d.gregg@gmail.com> wrote:
>
> On Fri, Dec 16, 2016 at 2:56 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > With arm-linux-gcc-4.2, almost every file we build in the kernel ends
> > up with this warning:
> >
> > include/linux/fs.h:2648: warning: comparison of unsigned expression < 0 is always false
> >
>
> Thanks, I'd like to see this fixed as a similar warning gets printed
> whenever running many of the bcc/BPF tools, which gets annoying and is
> user-visible. eg:
>
> # /usr/share/bcc/tools/xfsslower 1
> In file included from /virtual/main.c:3:
> /lib/modules/4.8.6-300.fc25.x86_64/build/include/linux/fs.h:2677:9:
> warning: comparison of unsigned enum expression < 0 is always false
> [-Wtautological-compare]
>         if (id < 0 || id >= READING_MAX_ID)
>             ~~ ^ ~
> 1 warning generated.
> Tracing XFS operations slower than 1 ms
> TIME     COMM           PID    T BYTES   OFF_KB   LAT(ms) FILENAME
> 14:44:27 cksum          4414   R 65536   0           1.02 chcon
> 14:44:27 cksum          4414   R 65536   0           1.20 cpio
> 14:44:27 cksum          4414   R 65536   0           1.01 diff
> 14:44:27 cksum          4414   R 65536   0           1.15 dir
> [...]
>
> This patch fixes the warning.
>

What's the status of this patch? I still get these warnings on latest. Thanks,

Brendan
