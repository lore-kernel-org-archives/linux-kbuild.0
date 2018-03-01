Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:21060 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934962AbeCAHpE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Mar 2018 02:45:04 -0500
MIME-Version: 1.0
In-Reply-To: <20180228051525.a2vouqs6djnd2cnf@huvuddator>
References: <1519776926-30459-1-git-send-email-yamada.masahiro@socionext.com>
 <1519776926-30459-6-git-send-email-yamada.masahiro@socionext.com> <20180228051525.a2vouqs6djnd2cnf@huvuddator>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 1 Mar 2018 16:44:17 +0900
Message-ID: <CAK7LNATWRmYf7nfGcFiGe2DF2PSkE9mrS51GytzWEz5DYToN0w@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] kconfig: invoke oldconfig instead of
 silentoldconfig from local*config
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Marc Herbert <marc.herbert@intel.com>, Sam Ravnborg <sam@ravnborg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-02-28 14:15 GMT+09:00 Ulf Magnusson <ulfalizer@gmail.com>:
> On Wed, Feb 28, 2018 at 09:15:25AM +0900, Masahiro Yamada wrote:
>> The purpose of local{yes,mod}config is to arrange the .config file
>> based on actually loaded modules.  It is unnecessary to update
>> include/generated/autoconf.h and include/config/* stuff here.
>>
>> They will be automatically updated during the build.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>> Changes in v2:
>>   - newly added
>>
>>  scripts/kconfig/Makefile | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
>> index c5d1d1a..bf9289a 100644
>> --- a/scripts/kconfig/Makefile
>> +++ b/scripts/kconfig/Makefile
>> @@ -49,11 +49,11 @@ localyesconfig localmodconfig: $(obj)/streamline_config.pl $(obj)/conf
>
> (Unrelated: $(obj)/streamline_config.pl is a checked-in file, so I
> wonder if there's any point to having it as a prerequisite of the phony
> targets local{yes,mod}config.)
>

Indeed.

It it unrelated, but I think it is worth fixing.

Care to send a patch, please?




-- 
Best Regards
Masahiro Yamada
