Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:28736 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757105AbdDRKOp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Apr 2017 06:14:45 -0400
MIME-Version: 1.0
In-Reply-To: <28527.1492509596@warthog.procyon.org.uk>
References: <20170403194636.96438-1-mka@chromium.org> <28527.1492509596@warthog.procyon.org.uk>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 18 Apr 2017 19:14:38 +0900
Message-ID: <CAK7LNAT67VSGqCtXfAgHvrQ1c8GCDts7LHBmYD1oann-BK_T0A@mail.gmail.com>
Subject: Re: [PATCH] frv: Use OFFSET macro in DEF_*REG()
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Matthias Kaehlcke <mka@chromium.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi David,

2017-04-18 18:59 GMT+09:00 David Howells <dhowells@redhat.com>:
> Matthias Kaehlcke <mka@chromium.org> wrote:
>
>> Avoid code duplication by using OFFSET() in DEF_*REG() instead of
>> replicating the macro.
>>
>> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
>
> Reviewed-by: David Howells <dhowells@redhat.com>


Ah, I've just noticed you are the last frv maintainer,
and now the frv is orphan.

So, I will pick up this patch to the kbuild tree.

Thanks!



-- 
Best Regards
Masahiro Yamada
