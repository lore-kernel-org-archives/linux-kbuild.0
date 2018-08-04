Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:37454 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725792AbeHDEXI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Aug 2018 00:23:08 -0400
MIME-Version: 1.0
In-Reply-To: <861c26a6-294c-755d-2396-e5d18b9bbcbf@infradead.org>
References: <be4f41de-c27a-abac-4b23-369c400e016e@infradead.org> <861c26a6-294c-755d-2396-e5d18b9bbcbf@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 4 Aug 2018 11:23:26 +0900
Message-ID: <CAK7LNARdoeKCNYV7Kp6YLNsJ4rjrjXRWMsf4op58-JzRYUNVtg@mail.gmail.com>
Subject: Re: kbuild: ARCH=um archheaders failed
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Richard Weinberger <richard@nod.at>, linux-um@lists.infradead.org

2018-08-04 0:41 GMT+09:00 Randy Dunlap <rdunlap@infradead.org>:
> On 08/02/2018 05:13 PM, Randy Dunlap wrote:
>> Hi Yamada-san,
>>
>> I see this every few weeks.  It's not reproducible (it depends
>> on the moon, Mars, etc.).
>>
>> I'm using O=builddir.  The build log is short (below).
>>
>> Do you see a makefile problem here?  (nothing to do with mmotm;
>> I see it more frequently with linux-next since I do many daily
>> builds with it)
>
> BTW, this is just um defconfig with -j4.
>
> --
> ~Randy
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



I will send a patch with commit description later
after more testing,
but the following patch should fix the issue.


diff --git a/arch/um/Makefile b/arch/um/Makefile
index d3975e7..1cec053 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -120,7 +120,7 @@ archheaders:
        $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.asm-generic \
                    kbuild-file=$(HOST_DIR)/include/uapi/asm/Kbuild \
                    obj=$(HOST_DIR)/include/generated/uapi/asm
-       $(Q)$(MAKE) KBUILD_SRC= ARCH=$(HEADER_ARCH) archheaders
+       $(Q)$(MAKE) -f $(srctree)/Makefile ARCH=$(HEADER_ARCH) archheaders


 archprepare: include/generated/user_constants.h



-- 
Best Regards
Masahiro Yamada
