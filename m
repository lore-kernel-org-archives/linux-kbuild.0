Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:59636 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1045622AbdDWO0s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 23 Apr 2017 10:26:48 -0400
MIME-Version: 1.0
In-Reply-To: <20170421182001.139199-1-mka@chromium.org>
References: <20170421182001.139199-1-mka@chromium.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 23 Apr 2017 23:26:35 +0900
Message-ID: <CAK7LNARHw-xeF695pFwrko+xeq5+44KB2jSNw7RbxzAeVE58Xw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Add better clang cross build support
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Behan Webster <behanw@converseincode.com>, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>, Peter Foley <pefoley2@pefoley.com>

2017-04-22 3:20 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> Add cross target to CC if using clang. Also add custom gcc toolchain
> path for fallback gcc tools.
>
> Clang will fallback to using things like ld, as, and libgcc if
> (respectively) one of the llvm linkers isn't available, the integrated
> assembler is turned off, or an appropriately cross-compiled version of
> compiler-rt isn't available. To this end, you can specify the path to
> this fallback gcc toolchain with GCC_TOOLCHAIN.
>
> From: Behan Webster <behanw@converseincode.com>
> Signed-off-by: Behan Webster <behanw@converseincode.com>
> Reviewed-by: Jan-Simon M=C3=B6ller <dl9pf@gmx.de>
> Reviewed-by: Mark Charlebois <charlebm@gmail.com>
> Signed-off-by: Greg Hackmann <ghackmann@google.com>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>


Applied to linux-kbuild/kbuild.  Thanks!




--=20
Best Regards
Masahiro Yamada
