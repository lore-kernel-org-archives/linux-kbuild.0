Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vc0-f171.google.com ([209.85.220.171]:38649 "EHLO
	mail-vc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754269AbaIIQ3s (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 9 Sep 2014 12:29:48 -0400
Received: by mail-vc0-f171.google.com with SMTP id id10so17252243vcb.2
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Sep 2014 09:29:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1410260638-23559-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1410260638-23559-1-git-send-email-yamada.m@jp.panasonic.com>
From: Peter Foley <pefoley2@pefoley.com>
Date: Tue, 9 Sep 2014 12:29:27 -0400
Message-ID: <CAOFdcFNvycz4B11ZBMeFrKfmvA8H-yBX7z+qDw_AUS5Ry03L4Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: simplify build, clean, modbuiltin shorthands
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, "H. Peter Anvin" <hpa@linux.intel.com>, Andi Kleen <ak@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>

On Tue, Sep 9, 2014 at 7:03 AM, Masahiro Yamada
<yamada.m@jp.panasonic.com> wrote:
> $(if $(KBUILD_SRC),$(srctree)/) was a useful strategy
> to omit a long absolute path for in-source-tree build
> prior to commit 890676c65d699db3ad82e7dddd0cf8fb449031af
> (kbuild: Use relative path when building in the source tree).
>
> Now $(srctree) is "." when building in the source tree.
> It would not be annoying to add "$(srctree)/" all the time.
>
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>

Acked-by: Peter Foley <pefoley2@pefoley.com>
