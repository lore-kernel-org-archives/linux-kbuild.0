Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:50271 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753404AbeGFBFy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jul 2018 21:05:54 -0400
MIME-Version: 1.0
In-Reply-To: <20180706.093103.1547249026984330034.davem@davemloft.net>
References: <03cfef31-5308-7b17-9e0d-3a0dc680e750@infradead.org> <20180706.093103.1547249026984330034.davem@davemloft.net>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 6 Jul 2018 10:04:51 +0900
Message-ID: <CAK7LNASqFLGVJ56dXBgj9P=S5UGCWMtJDtxVZb5t-tvTH3vckQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: update ARCH alias info for sparc
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, David Miller <davem@davemloft.net>

2018-07-06 9:31 GMT+09:00 David Miller <davem@davemloft.net>:
> From: Randy Dunlap <rdunlap@infradead.org>
> Date: Thu, 5 Jul 2018 12:12:03 -0700
>
>> From: Randy Dunlap <rdunlap@infradead.org>
>>
>> The supported alias for building sparc 32-bit is "sparc32",
>> not "sparc", so update the alias documentation for that.
>> Just using "sparc" produces a 64-bit config file.
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>
> Acked-by: David S. Miller <davem@davemloft.net>
> --

Applied to linux-kbuild. Thanks!



-- 
Best Regards
Masahiro Yamada
