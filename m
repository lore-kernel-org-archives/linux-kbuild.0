Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:35265 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750733AbdITDkA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Sep 2017 23:40:00 -0400
MIME-Version: 1.0
In-Reply-To: <c5600059-fc62-0ceb-d730-95d94c9a625d@osg.samsung.com>
References: <cover.1505257614.git.shuahkh@osg.samsung.com> <be0b069dde5b07b543498e274c3a9cc0c6e817c0.1505257614.git.shuahkh@osg.samsung.com>
 <c5600059-fc62-0ceb-d730-95d94c9a625d@osg.samsung.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 20 Sep 2017 12:39:10 +0900
Message-ID: <CAK7LNAQUMCd8QMn9WfZxPUyy-g1BrWvnKxZVELqZGjtCuVWApQ@mail.gmail.com>
Subject: Re: [PATCH 01/11] Makefile: kselftest and kselftest-clean fail for
 make O=dir case
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: Michal Marek <mmarek@suse.com>, shuah@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, bamvor.zhangjian@linaro.org, emilio.lopez@collabora.co.uk, Jonathan Corbet <corbet@lwn.net>, tytso@mit.edu, ebiederm@xmission.com, Tim.Bird@sony.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kselftest@vger.kernel.org

2017-09-19 8:14 GMT+09:00 Shuah Khan <shuahkh@osg.samsung.com>:
> On 09/12/2017 05:52 PM, Shuah Khan wrote:
>> kselftest and kselftest-clean targets fail when object directory is
>> specified to relocate objects. Fix it so it can find the source tree
>> to build from.
>>
>> make O=/tmp/kselftest_top kselftest
>>
>> make[1]: Entering directory '/tmp/kselftest_top'
>> make[2]: Entering directory '/tmp/kselftest_top'
>> make[2]: *** tools/testing/selftests: No such file or directory.  Stop.
>> make[2]: Leaving directory '/tmp/kselftest_top'
>> ./linux-kselftest/Makefile:1185: recipe for target
>> 'kselftest' failed
>> make[1]: *** [kselftest] Error 2
>> make[1]: Leaving directory '/tmp/kselftest_top'
>> Makefile:145: recipe for target 'sub-make' failed
>> make: *** [sub-make] Error 2
>>
>> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
>
> Hi Masahiro/Michal,
>
> Is it okay to take this patch via linux-kselftest git? If you are okay
> with that, please Ack it and I will plan to include this in my update.
>
> thanks,
> -- Shuah
>
>
>> ---
>>  Makefile | 13 +++++++++----
>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index eccb8d704c23..6a85322d0b3e 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1180,13 +1180,18 @@ headers_check: headers_install
>>  # ---------------------------------------------------------------------------
>>  # Kernel selftest
>>
>> +PHONY += __kselftest
>> +     kselftest_src := tools/testing/selftests
>> +     ifneq ($(KBUILD_SRC),)
>> +             kselftest_src := $(KBUILD_SRC)/tools/testing/selftests
>> +     endif
>>  PHONY += kselftest
>> -kselftest:
>> -     $(Q)$(MAKE) -C tools/testing/selftests run_tests
>> +kselftest: __kselftest
>> +     $(Q)$(MAKE) -C $(kselftest_src) run_tests
>>
>>  PHONY += kselftest-clean
>> -kselftest-clean:
>> -     $(Q)$(MAKE) -C tools/testing/selftests clean
>> +kselftest-clean: __kselftest
>> +     $(Q)$(MAKE) -C $(kselftest_src) clean
>>
>>  PHONY += kselftest-merge
>>  kselftest-merge:
>>
>

Why don't you simply add $(srctree)/ to tools/testing/selftests?

Like,

PHONY += kselftest
kselftest:
        $(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests

PHONY += kselftest-clean
kselftest-clean:
        $(Q)$(MAKE) -C $(srctree)/tools/testing/selftests clean



-- 
Best Regards
Masahiro Yamada
