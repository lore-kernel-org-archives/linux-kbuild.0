Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vs1-f68.google.com ([209.85.217.68]:42323 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbgBLRNx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Feb 2020 12:13:53 -0500
Received: by mail-vs1-f68.google.com with SMTP id b79so1638400vsd.9
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Feb 2020 09:13:52 -0800 (PST)
MIME-Version: 1.0
References: <20200210131925.145463-1-samitolvanen@google.com> <CAK7LNAS7UchtP_+2m4AB-hJ=nMwsM-qpkJ+VHU1JGJrn8K1KPg@mail.gmail.com>
In-Reply-To: <CAK7LNAS7UchtP_+2m4AB-hJ=nMwsM-qpkJ+VHU1JGJrn8K1KPg@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 12 Feb 2020 09:13:40 -0800
Message-ID: <CABCJKuemBAeySJQY6yxhzbxK=XGBtVSt+6J6WXpO=RoiVXH7GQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove duplicate dependencies from .mod files
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Feb 12, 2020 at 5:23 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> In which case are undefined symbols duplicated?

When a module consists of multiple compilation units, which depend on
the same external symbols. In Android, we ran into this when adding
hardening features that all depend on an external error handler
function with a rather long name. When CONFIG_TRIM_UNUSED_SYMS was
later enabled, we ran into this:

$ llvm-nm drivers/gpu/drm/nouveau/nouveau.o | sed -n 's/^  *U //p' |
xargs echo | wc
      2    9136  168660

xargs defaults to 128kiB limit for command line size, so the output
was split into two lines, which means some of the dependencies were
dropped and we ran into modpost errors. One method of fixing this is
to increase the limit:

$ llvm-nm drivers/gpu/drm/nouveau/nouveau.o | sed -n 's/^  *U //p' |
xargs -s 262144 echo | wc
      1    9136  168660

But it seems removing duplicates is a better solution as the length of
the dependency list is reduced significantly:

$ llvm-nm drivers/gpu/drm/nouveau/nouveau.o | sed -n 's/^  *U //p' |
sort -u | xargs echo | wc
      1    2716   50461

> Do you have a .config to reproduce it?

I can currently reproduce this on an Android kernel that has
Control-Flow Integrity (CFI) enabled. While this feature is not
upstreamed yet, there's nothing that would prevent us from hitting the
command line limit with sufficiently large modules otherwise as well.

Sami
