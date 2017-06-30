Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([59.151.112.132]:59000 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751656AbdF3C1u (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Jun 2017 22:27:50 -0400
Subject: Re: [PATCH] kbuild: improve comments on KBUILD_SRC
References: <1498203062-13090-1-git-send-email-caoj.fnst@cn.fujitsu.com>
 <CAK7LNARCM+Xb_TnBszB59OCPCK-8aw0ANkR_WbHBis4kEUi0-A@mail.gmail.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <5955B7F8.7060603@cn.fujitsu.com>
Date: Fri, 30 Jun 2017 10:31:20 +0800
MIME-Version: 1.0
In-Reply-To: <CAK7LNARCM+Xb_TnBszB59OCPCK-8aw0ANkR_WbHBis4kEUi0-A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>



On 06/29/2017 11:14 PM, Masahiro Yamada wrote:
> 2017-06-23 16:31 GMT+09:00 Cao jin <caoj.fnst@cn.fujitsu.com>:
>> Original comments is confusing on "OBJ directory", make it clear.
>>
>> Bonus: move comments close to what it want to comment.
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>> ---
>>  Makefile | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 57df756..81c0df9 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -113,8 +113,9 @@ export quiet Q KBUILD_VERBOSE
>>  # The O= assignment takes precedence over the KBUILD_OUTPUT environment
>>  # variable.
>>
>> -# KBUILD_SRC is set on invocation of make in OBJ directory
>> -# KBUILD_SRC is not intended to be used by the regular user (for now)
>> +# KBUILD_SRC is not intended to be used by the regular user (for now),
>> +# it is set on invocation of make in KBUILD_OUTPUT directory, i.e., it
>> +# is set on using "make O=dir/to/store/output/files/"
> 
> O= is not only the way to specify the output directory.
> 
> KBUILD_OUTPUT is used not only for an internal variable
> but also for user interface to specify the output directory
> (via environments).
> 
> 
> How about something like this?
> 
> # KBUILD_SRC is not intended to be used by the regular user (for now),
> # it is set on invocation of make with KBUILD_OUTPUT or O= specified.
> 

Accurate and much better. Thanks a lot. v2 is on the way.

-- 
Sincerely,
Cao jin


