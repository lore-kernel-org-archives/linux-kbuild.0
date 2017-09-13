Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:40436
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751308AbdIMTna (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Sep 2017 15:43:30 -0400
Subject: Re: [PATCH 09/11] selftests: lib.mk: copy test scripts and test files
 for make O=dir run
References: <cover.1505257614.git.shuahkh@osg.samsung.com>
 <7778068aed3cd76e2bc7f589e2409fe5a9eed75f.1505257614.git.shuahkh@osg.samsung.com>
 <ECADFF3FD767C149AD96A924E7EA6EAF3AD1BF23@USCULXMSG01.am.sony.com>
From: Shuah Khan <shuahkh@osg.samsung.com>
Message-ID: <4d106891-bfbd-294b-df2c-0769117aa9d3@osg.samsung.com>
Date: Wed, 13 Sep 2017 13:43:19 -0600
MIME-Version: 1.0
In-Reply-To: <ECADFF3FD767C149AD96A924E7EA6EAF3AD1BF23@USCULXMSG01.am.sony.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Bird, Timothy" <Tim.Bird@sony.com>, "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>, "mmarek@suse.com" <mmarek@suse.com>, "shuah@kernel.org" <shuah@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "peterz@infradead.org" <peterz@infradead.org>, "bamvor.zhangjian@linaro.org" <bamvor.zhangjian@linaro.org>, "emilio.lopez@collabora.co.uk" <emilio.lopez@collabora.co.uk>, "corbet@lwn.net" <corbet@lwn.net>
Cc: "tytso@mit.edu" <tytso@mit.edu>, "ebiederm@xmission.com" <ebiederm@xmission.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, Shuah Khan <shuahkh@osg.samsung.com>

On 09/13/2017 12:14 PM, Bird, Timothy wrote:
> 
> 
>> -----Original Message-----
>> From: Shuah Khan on Tuesday, September 12, 2017 4:53 PM
>>
>> For make O=dir run_tests to work, test scripts, test files, and other
>> dependencies need to be copied over to the object directory. Running
>> tests from the object directory is necessary to avoid making the source
>> tree dirty.
>>
>> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
>> ---
>>  tools/testing/selftests/lib.mk | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
>> index 2e13cabb8007..9aa820d35c0c 100644
>> --- a/tools/testing/selftests/lib.mk
>> +++ b/tools/testing/selftests/lib.mk
>> @@ -37,7 +37,18 @@ define RUN_TESTS
>>  endef
>>
>>  run_tests: all
>> +ifneq ($(KBUILD_SRC),)
>> +	@if [ "X$(TEST_PROGS) $(TEST_PROGS_EXTENDED) $(TEST_FILES)" !=
>> "X" ]; then
>> +		@rsync -aq $(TEST_PROGS) $(TEST_PROGS_EXTENDED)
>> $(TEST_FILES) $(OUTPUT)
> 
> rsync seems a bit heavy-handed for this.  Is there a reason to use
> rsync vs. just a regular cp?   Does the existing kbuild system already
> have a dependency on rsync?  If not, I don't think we should introduce one
> here.
> 

rsync is used now in kselftest make files for install. The reason
I picked rsync in this case is that these files might exist in the
object directory, if the same object directory is used for multiple
kselftest builds. Using rsync helps avoid copying them again. These
files are not generated each time build is run. These are shell scripts
and other dependencies that won't change from build to build.

Are you concerned about rsync availability on some environments?

> BTW - great work!

Thanks.

> 
>> +	fi
>> +	@if [ "X$(TEST_PROGS)" != "X" ]; then
>> +		$(call RUN_TESTS, $(TEST_GEN_PROGS)
>> $(TEST_CUSTOM_PROGS) $(OUTPUT)/$(TEST_PROGS))
>> +	else
>> +		$(call RUN_TESTS, $(TEST_GEN_PROGS)
>> $(TEST_CUSTOM_PROGS))
>> +	fi
>> +else
>>  	$(call RUN_TESTS, $(TEST_GEN_PROGS) $(TEST_CUSTOM_PROGS)
>> $(TEST_PROGS))
>> +endif
>>
>>  define INSTALL_RULE
>>  	@if [ "X$(TEST_PROGS)$(TEST_PROGS_EXTENDED)$(TEST_FILES)" !=
>> "X" ]; then					\
>> --
>> 2.11.0
>>
> 

thanks,
-- Shuah
