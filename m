Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:47640 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1033554AbdDUHkx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Apr 2017 03:40:53 -0400
MIME-Version: 1.0
In-Reply-To: <20170420194200.108884-1-mka@chromium.org>
References: <20170420194200.108884-1-mka@chromium.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 21 Apr 2017 16:40:43 +0900
Message-ID: <CAK7LNAQj+7ZNxJrCAB+CkMH8xcH5J7R8ag1fmkWAa714A3d+Ew@mail.gmail.com>
Subject: Re: [PATCH RESEND] Makefile, LLVM: add -no-integrated-as to KBUILD_[AC]FLAGS
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>

2017-04-21 4:42 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> From: Michael Davidson <md@google.com>
>
> Add -no-integrated-as to KBUILD_AFLAGS and KBUILD_CFLAGS
> for clang.
>
> Signed-off-by: Michael Davidson <md@google.com>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>


Michael sent this to the kbuild ML, so
you need not re-send it with your additional signed-off-by.

Actually, re-sending patches is no more helpful than
a ping message.



-- 
Best Regards
Masahiro Yamada
