Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f67.google.com ([209.85.166.67]:33095 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731149AbgCaQpM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 12:45:12 -0400
Received: by mail-io1-f67.google.com with SMTP id o127so22431821iof.0
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2020 09:45:12 -0700 (PDT)
Subject: Re: [PATCH] Makefile: Update kselftest help information
References: <20200330180711.14393-1-skhan@linuxfoundation.org>
 <CAK7LNARyVVNo8Ck4=s_bkwfxuFXj7MUFr2E_f-oOZEkjgm5Bmg@mail.gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <b580e8ce-1879-c516-72c8-041b2422ad1d@linuxfoundation.org>
Date: Tue, 31 Mar 2020 10:45:09 -0600
MIME-Version: 1.0
In-Reply-To: <CAK7LNARyVVNo8Ck4=s_bkwfxuFXj7MUFr2E_f-oOZEkjgm5Bmg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Shuah Khan <skhan@linuxfoundation.org>

On 3/31/20 10:11 AM, Masahiro Yamada wrote:
> On Tue, Mar 31, 2020 at 3:07 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> Update kselftest help information.
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>> ---
>>   Makefile | 15 +++++++++------
>>   1 file changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index e56bf7ef182d..5e5c770423c7 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1470,12 +1470,15 @@ help:
>>          @echo  '  nsdeps          - Generate missing symbol namespace dependencies'
>>          @echo  ''
>>          @echo  'Kernel selftest:'
>> -       @echo  '  kselftest       - Build and run kernel selftest (run as root)'
>> -       @echo  '                    Build, install, and boot kernel before'
>> -       @echo  '                    running kselftest on it'
>> -       @echo  '  kselftest-clean - Remove all generated kselftest files'
>> -       @echo  '  kselftest-merge - Merge all the config dependencies of kselftest to existing'
>> -       @echo  '                    .config.'
>> +       @echo  '  kselftest         - Build and run kernel selftest'
>> +       @echo  '                      Build, install, and boot kernel before'
>> +       @echo  '                      running kselftest on it'
>> +       @echo  '                      Run as root for full coverage'
>> +       @echo  '  kselftest-all     - Build kernel selftest'
>> +       @echo  '  kselftest-install - Build and install kernel selftest'
>> +       @echo  '  kselftest-clean   - Remove all generated kselftest files'
>> +       @echo  '  kselftest-merge   - Merge all the config dependencies of'
>> +       @echo  '                      kselftest to existing .config.'
>>          @echo  ''
>>          @$(if $(dtstree), \
>>                  echo 'Devicetree:'; \
>> --
>> 2.20.1
>>
> 
> 
> Applied to linux-kbuild. Thanks.

Thanks.

> 
> But, if we have more entries in the future,
> we might want to consider to move these
> to tools/testing/selftests/Makefile.
> 
>
Agreed.

thanks,
-- Shuah
