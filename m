Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail9.hitachi.co.jp ([133.145.228.44]:39631 "EHLO
	mail9.hitachi.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750905AbbADF3n (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 4 Jan 2015 00:29:43 -0500
Message-ID: <54A8CFBE.2010209@hitachi.com>
Date: Sun, 04 Jan 2015 14:29:34 +0900
From: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
MIME-Version: 1.0
Subject: Re: Re: [PATCH v3 05/20] selftests/ftrace: add install target
 to enable test install
References: <cover.1419387513.git.shuahkh@osg.samsung.com> <e84eeeecde70ecb3ab82c5f825fec359f9e967ff.1419387513.git.shuahkh@osg.samsung.com> <20150102104526.29df5641@gandalf.local.home>
In-Reply-To: <20150102104526.29df5641@gandalf.local.home>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Shuah Khan <shuahkh@osg.samsung.com>, mmarek@suse.cz, gregkh@linuxfoundation.org, akpm@linux-foundation.org, mingo@redhat.com, davem@davemloft.net, keescook@chromium.org, tranmanphong@gmail.com, mpe@ellerman.id.au, cov@codeaurora.org, dh.herrmann@gmail.com, hughd@google.com, bobby.prani@gmail.com, serge.hallyn@ubuntu.com, ebiederm@xmission.com, tim.bird@sonymobile.com, josh@joshtriplett.org, koct9i@gmail.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, netdev@vger.kernel.org, "yrl.pp-manager.tt@hitachi.com" <yrl.pp-manager.tt@hitachi.com>

(2015/01/03 0:45), Steven Rostedt wrote:
> On Wed, 24 Dec 2014 09:27:41 -0700
> Shuah Khan <shuahkh@osg.samsung.com> wrote:
> 
>> Add a new make target to enable installing test. This target
>> installs test in the kselftest install location and add to the
>> kselftest script to run the test. Install target can be run
>> only from top level kernel source directory.
>>
>> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
>> ---
>>  tools/testing/selftests/ftrace/Makefile | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/ftrace/Makefile b/tools/testing/selftests/ftrace/Makefile
>> index 76cc9f1..7c7cf42 100644
>> --- a/tools/testing/selftests/ftrace/Makefile
>> +++ b/tools/testing/selftests/ftrace/Makefile
>> @@ -1,7 +1,16 @@
>> +TEST_STR = /bin/sh ./ftracetest || echo ftrace selftests: [FAIL]
> 
> Is it ok that this removes the quotes around the echo string? I don't
> see anything wrong about it, but I don't know if there's a shell out
> there that will fail due to it.

Agreed, if possible, we'd better add quotes around the echo string
as you did in 2/20 in this series.

Anyway, you can also add my ack to this patch.

Acked-by: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>

Thank you!

> 
> Other than than,
> 
> Acked-by: Steven Rostedt <rostedt@goodmis.org>
> 
> -- Steve
> 
> 
>> +
>>  all:
>>  
>> +install:
>> +ifdef INSTALL_KSFT_PATH
>> +	install ./ftracetest $(INSTALL_KSFT_PATH)
>> +	@cp -r test.d $(INSTALL_KSFT_PATH)
>> +	echo "$(TEST_STR)" >> $(KSELFTEST)
>> +endif
>> +
>>  run_tests:
>> -	@/bin/sh ./ftracetest || echo "ftrace selftests: [FAIL]"
>> +	@$(TEST_STR)
>>  
>>  clean:
>>  	rm -rf logs/*
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 


-- 
Masami HIRAMATSU
Software Platform Research Dept. Linux Technology Center
Hitachi, Ltd., Yokohama Research Laboratory
E-mail: masami.hiramatsu.pt@hitachi.com


