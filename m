Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f53.google.com ([209.85.214.53]:45458 "EHLO
        mail-it0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752148AbdKTTsg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Nov 2017 14:48:36 -0500
MIME-Version: 1.0
In-Reply-To: <CAK7LNASBKPMG5eZ2yXPL_xOYUjr+0J56YMC5VRsE6o=xqz=DzA@mail.gmail.com>
References: <cover.3dd1d0c1f15a7a7c418f20ebafc9719afc1c2704.1510840787.git-series.knut.omang@oracle.com>
 <716fa938a4ab0ad66490b72e2ed750cd6583728f.1510840787.git-series.knut.omang@oracle.com>
 <CAK7LNASBKPMG5eZ2yXPL_xOYUjr+0J56YMC5VRsE6o=xqz=DzA@mail.gmail.com>
From: Jim Davis <jim.epost@gmail.com>
Date: Mon, 20 Nov 2017 12:48:35 -0700
Message-ID: <CA+r1ZhgPUJ_WtCM=RgiPSrSvGrp7FMni2db6S9am5-LN_vhRdg@mail.gmail.com>
Subject: Re: [PATCH 2/7] kbuild: Add P= command line flag to run checkpatch
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Knut Omang <knut.omang@oracle.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, Nov 20, 2017 at 9:18 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

>
> I am unhappy about adding a new interface
> for each checker.
>
> The default of CHECK is "sparse", but
> users can override it to use another checker.
>
>
>
> As Decumentation/dev-tools/coccinelle.rst says,
> if you want to use coccinelle as a checker,
>
> make C=1 CHECK="scripts/coccicheck"
>

I'd be nice if people could just specify CHECK and CHECKFLAGS to run
their favorite checker, but currently CHECKFLAGS seems hardwired for
running sparse.  So something liike

make C=1 CHECK="scripts/checkpatch.pl" CHECKFLAGS="--quiet --file"

fails when checkpatch is passed lots of arguments like -D__linux__
-Dlinux -D__STDC__ .  A little shell wrapper to grab the last argument
in that long list is a workaround, but perhaps CHECKFLAGS should be
made less sparse-specific?

-- 
Jim
