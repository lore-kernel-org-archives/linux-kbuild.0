Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f68.google.com ([209.85.166.68]:41936 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732892AbfJPQIy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Oct 2019 12:08:54 -0400
Received: by mail-io1-f68.google.com with SMTP id n26so54440204ioj.8
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Oct 2019 09:08:53 -0700 (PDT)
Subject: Re: [PATCH v2] selftests: Add kselftest-all and kselftest-install
 targets
References: <20190926224014.28910-1-skhan@linuxfoundation.org>
 <87sgnttpoq.fsf@mpe.ellerman.id.au>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <adcfcda4-c36e-c222-4964-f83b5f3d0097@linuxfoundation.org>
Date: Wed, 16 Oct 2019 10:08:50 -0600
MIME-Version: 1.0
In-Reply-To: <87sgnttpoq.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, yamada.masahiro@socionext.com, michal.lkml@markovi.net, shuah@kernel.org
Cc: linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, "skh >> Shuah Khan" <skhan@linuxfoundation.org>

On 10/15/19 8:00 PM, Michael Ellerman wrote:
> Hi Shuah,
> 
> I know this has been merged already, so this is just FYI and in case it
> helps anyone else who's tracking down build failures.
> 

Thanks for letting me know. I have been sending updates about
breakages. Will send an update with this info.

> Sorry I didn't reply before you merged it, I was on leave.
> 
> Shuah Khan <skhan@linuxfoundation.org> writes:
>> Add kselftest-all target to build tests from the top level
>> Makefile. This is to simplify kselftest use-cases for CI and
>> distributions where build and test systems are different.
>>
>> Current kselftest target builds and runs tests on a development
>> system which is a developer use-case.
>>
>> Add kselftest-install target to install tests from the top level
>> Makefile. This is to simplify kselftest use-cases for CI and
>> distributions where build and test systems are different.
>>
>> This change addresses requests from developers and testers to add
>> support for installing kselftest from the main Makefile.
>>
>> In addition, make the install directory the same when install is
>> run using "make kselftest-install" or by running kselftest_install.sh.
>> Also fix the INSTALL_PATH variable conflict between main Makefile and
>> selftests Makefile.
> ...
>> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
>> index c3feccb99ff5..bad18145ed1a 100644
>> --- a/tools/testing/selftests/Makefile
>> +++ b/tools/testing/selftests/Makefile
>> @@ -171,9 +171,12 @@ run_pstore_crash:
>>   # 1. output_dir=kernel_src
>>   # 2. a separate output directory is specified using O= KBUILD_OUTPUT
>>   # 3. a separate output directory is specified using KBUILD_OUTPUT
>> +# Avoid conflict with INSTALL_PATH set by the main Makefile
>>   #
>> -INSTALL_PATH ?= $(BUILD)/install
>> -INSTALL_PATH := $(abspath $(INSTALL_PATH))
>> +KSFT_INSTALL_PATH ?= $(BUILD)/kselftest_install
> 
> This change broke all my CI, because the tests no longer install in the
> place it's expecting them :/
> 

Sorry about that.

> I can fix it by explicitly specifying the install path in my CI scripts.
> 
>> +KSFT_INSTALL_PATH := $(abspath $(KSFT_INSTALL_PATH))
>> +# Avoid changing the rest of the logic here and lib.mk.
>> +INSTALL_PATH := $(KSFT_INSTALL_PATH)
>


I searched all the selftests Makefiles for it and convinced myself that,
the above would take care of it for these cases. I searched powerpc
Makefiles so this doesn't break it. Didn't think about the CI.

android/Makefile:	mkdir -p $(INSTALL_PATH)
android/Makefile:	install -t $(INSTALL_PATH) $(TEST_PROGS) 
$(TEST_PROGS_EXTENDED) $(TEST_FILES)
android/Makefile:		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$SUBDIR 
INSTALL_PATH=$(INSTALL_PATH)/$$SUBDIR install; \
futex/Makefile:	mkdir -p $(INSTALL_PATH)
futex/Makefile:	install -t $(INSTALL_PATH) $(TEST_PROGS) 
$(TEST_PROGS_EXTENDED) $(TEST_FILES)
futex/Makefile:		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$SUBDIR 
INSTALL_PATH=$(INSTALL_PATH)/$$SUBDIR install; \
sparc64/Makefile:	mkdir -p $(INSTALL_PATH)
sparc64/Makefile:	install -t $(INSTALL_PATH) $(TEST_PROGS) 
$(TEST_PROGS_EXTENDED) $(TEST_FILES)
sparc64/Makefile:		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$SUBDIR 
INSTALL_PATH=$(INSTALL_PATH)/$$SUBDIR install; \


> But because the over-rideable variable changed from INSTALL_PATH to
> KSFT_INSTALL_PATH I will need to export both of them in order for my CI
> to work with old and new kernels.

My mistake. I overlooked that this could be overridden and could
be in used in CI scripts.

> 
> So to emulate the old behaviour for old & new kernels you need to do:
> 
> # export KSFT_INSTALL_PATH=install
> # export INSTALL_PATH=install

Can we avoid exporting both if we updated INSTALL_PATH with 
KSFT_INSTALL_PATH in all the Makefiles instead of my shortcut?
Would that make it easier for you?

> # make -C tools/testing/selftests install
> 
> 

I am looking to simplify the use-case and ran into the INSTALL_PATH
variable conflict between main Makefile and selftests Makefile.

I think this should have been KSFT_INSTALL_PATH to begin with.

thanks,
-- Shuah
