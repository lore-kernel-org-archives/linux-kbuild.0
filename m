Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:47904 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756019AbdDRI0e (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Apr 2017 04:26:34 -0400
MIME-Version: 1.0
In-Reply-To: <20170417203518.GP28657@google.com>
References: <20170403194636.96438-1-mka@chromium.org> <20170417203518.GP28657@google.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 18 Apr 2017 17:26:14 +0900
Message-ID: <CAK7LNAQu1p_Vi72WrebxB9M2qwh6OupQxC2-ueCTFAoz7TO_5w@mail.gmail.com>
Subject: Re: [PATCH] frv: Use OFFSET macro in DEF_*REG()
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: David Howells <dhowells@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2017-04-18 5:35 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> El Mon, Apr 03, 2017 at 12:46:36PM -0700 Matthias Kaehlcke ha dit:
>
>> Avoid code duplication by using OFFSET() in DEF_*REG() instead of
>> replicating the macro.
>>
>> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
>
> Ping, any feedback on this patch?
>
> Thanks
>
> Matthias

If this is not picked up via frv tree,
I will apply it to kbuild tree.

(frv does not seem very active these days.)

Let's wait a bit and see if we get a response.



-- 
Best Regards
Masahiro Yamada
