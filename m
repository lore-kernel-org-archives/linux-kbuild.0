Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:27015 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725756AbeHQEz4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Aug 2018 00:55:56 -0400
MIME-Version: 1.0
In-Reply-To: <4f6673db-5b59-c3b1-042c-b36057c31c13@redhat.com>
References: <20180816170555.21623-1-msuchanek@suse.de> <4f6673db-5b59-c3b1-042c-b36057c31c13@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 17 Aug 2018 10:53:48 +0900
Message-ID: <CAK7LNASy_SEORuAE-mbS6MXCFhxGbzjahpYrWRkLS8zT7ax_Kg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix LOADLIBES rename in Documentation/kbuild/makefiles.txt
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>, Michal Suchanek <msuchanek@suse.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Jonathan Corbet <corbet@lwn.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-08-17 4:23 GMT+09:00 Laura Abbott <labbott@redhat.com>:
> On 08/16/2018 10:05 AM, Michal Suchanek wrote:
>>
>> Fixes: 8377bd2b9ee1 ("kbuild: Rename HOST_LOADLIBES to
>>                 KBUILD_HOSTLDLIBS")
>>
>> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
>
>
> Acked-by: Laura Abbott <labbott@redhat.com>


Applied to linux-kbuild. Thanks!


>
>> ---
>>   Documentation/kbuild/makefiles.txt | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/kbuild/makefiles.txt
>> b/Documentation/kbuild/makefiles.txt
>> index 766355b1d221..7b6a2b2bdc98 100644
>> --- a/Documentation/kbuild/makefiles.txt
>> +++ b/Documentation/kbuild/makefiles.txt
>> @@ -680,7 +680,7 @@ Both possibilities are described in the following.
>>         Example:
>>                 #scripts/kconfig/Makefile
>> -               HOSTLOADLIBES_qconf := -L$(QTDIR)/lib
>> +               HOSTLDLIBS_qconf := -L$(QTDIR)/lib
>>         When linking qconf, it will be passed the extra option
>>         "-L$(QTDIR)/lib".
>>
>



-- 
Best Regards
Masahiro Yamada
