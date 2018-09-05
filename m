Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:48402 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbeIEUqv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Sep 2018 16:46:51 -0400
Subject: Re: [PATCH] kbuild: modules_install: Warn if System.map file is not
 found
References: <b82ada4b-25d1-5612-4405-d6a09eb59433@infradead.org>
 <CAK7LNATshpTJ5sDH7pMzBbhd-zF7Yskv6ptiysn1X+pHB1Z8Dw@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3c595996-d6b2-1714-8b3b-3f21ab56263f@infradead.org>
Date: Wed, 5 Sep 2018 09:15:54 -0700
MIME-Version: 1.0
In-Reply-To: <CAK7LNATshpTJ5sDH7pMzBbhd-zF7Yskv6ptiysn1X+pHB1Z8Dw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On 09/05/2018 12:17 AM, Masahiro Yamada wrote:
> Hi Randy,
> 
> 2018-09-01 7:33 GMT+09:00 Randy Dunlap <rdunlap@infradead.org>:
>> From: Randy Dunlap <rdunlap@infradead.org>
>>
>> If there is no System.map file for "make modules_install",
>> scripts/depmod.sh will silently exit with success, having done
>> nothing.  Since this is an unexpected situation, change it to
>> report a Warning for the missing file.  The behavior is not
>> changed except for the Warning message.
>>
>> The (previous) silent success and new Warning can be reproduced
>> by:
>> $ make mrproper; make defconfig
>> $ make modules; make modules_install
>>
>> and since System.map is produced by "make vmlinux", the steps
>> above omit producing the System.map file.
>>
>> Reported-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> ---
>>  scripts/depmod.sh |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> --- lnx-419-rc1.orig/scripts/depmod.sh
>> +++ lnx-419-rc1/scripts/depmod.sh
>> @@ -11,6 +11,7 @@ DEPMOD=$1
>>  KERNELRELEASE=$2
>>
>>  if ! test -r System.map ; then
>> +       echo "Warning: modules_install: missing 'System.map' file"
>>         exit 0
>>  fi
> 
> Thanks for the patch.
> 
> 
> For consistency, I'd like to suggest '>&2' for this warning too.
> 
> 
> Also, could you add a little more info
> about what happened (or what did not happen) then ?
> 
> 
> 
> For example,
> 
> 
> Warning: modules_install: missing 'System.map' file.  Skipping depmod.

Sure, will do.

thanks,
-- 
~Randy
