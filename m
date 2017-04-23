Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:19295 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1427671AbdDWGyh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 23 Apr 2017 02:54:37 -0400
MIME-Version: 1.0
In-Reply-To: <28527.1492509596@warthog.procyon.org.uk>
References: <20170403194636.96438-1-mka@chromium.org> <28527.1492509596@warthog.procyon.org.uk>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 23 Apr 2017 15:54:27 +0900
Message-ID: <CAK7LNATbrJmFdSQdNDzb8SgNgo9yLmFX3Pv1+pwMoHaDxX=5GA@mail.gmail.com>
Subject: Re: [PATCH] frv: Use OFFSET macro in DEF_*REG()
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, Matthias Kaehlcke <mka@chromium.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2017-04-18 18:59 GMT+09:00 David Howells <dhowells@redhat.com>:
> Matthias Kaehlcke <mka@chromium.org> wrote:
>
>> Avoid code duplication by using OFFSET() in DEF_*REG() instead of
>> replicating the macro.
>>
>> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
>
> Reviewed-by: David Howells <dhowells@redhat.com>
> --


Applied to linux-kbuild/kbuild.


-- 
Best Regards
Masahiro Yamada
