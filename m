Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:34009 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753119AbbGXKMt (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 24 Jul 2015 06:12:49 -0400
Received: by wibud3 with SMTP id ud3so59032229wib.1
        for <linux-kbuild@vger.kernel.org>; Fri, 24 Jul 2015 03:12:48 -0700 (PDT)
Message-ID: <55B20F9C.4020607@linaro.org>
Date: Fri, 24 Jul 2015 11:12:44 +0100
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Subject: Re: [PATCH RFC] merge_config.sh: Add support to pass arguments to
 make
References: <1437484956-23985-1-git-send-email-srinivas.kandagatla@linaro.org> <CAK7LNAQKJXRkuWnSpyMtp95uOrGYmQkKYGoYwqw-5wUJLF9bFw@mail.gmail.com>
In-Reply-To: <CAK7LNAQKJXRkuWnSpyMtp95uOrGYmQkKYGoYwqw-5wUJLF9bFw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.cz>, yann.morin.1998@free.fr, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


Hi Mashahiro,

Thanks for the comments.
On 24/07/15 07:10, Masahiro Yamada wrote:
> Hi Srinivas,
>
>
> 2015-07-21 22:22 GMT+09:00 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>:
>> The issue is flags like ARCH can be passed to make via environment variable
>> or at command line by passing "ARCH=" argument to make file. The former case
>> works fine if used with merge_config but the later case would not work and
>> resulting config file from merge_config is useless.
>>
>> I hit this issue when I started using config fragments on arm64 bit platform
>> and I usually pass ARCH at the make command line.
>
> Me too.  I always pass ARCH from the make command line.
>
> I did a simple test, but I did not hit this issue.
>
> I think both environment variables and make command line variables
> are inherited to sub-processes.
>
> I guess this patch is useful only when we directly invoke this shell script,
> not via the top-level Makefile.  But, from your statement, I thought
> you invoke merge_config.sh from the Makefile.  So, I cannot understand
> what you mean.

Actually Am invoking the script directly, Is this a valid usage?
If this usage is not valid we can ignore this patch I guess :-)

Sorry I should have put my command line in the log to make it clear.

I use below command:
  ./scripts/kconfig/merge_config.sh  -O /objs/ 
arch/arm64/configs/defconfig distro.conf

>
> Moreover, the top-level Makefile exports ARCH, so it is always an
> environment variable.
>
> See the line 408:
> export ARCH SRCARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD CC
>
Yes, It works if invoked with make with your patch "kbuild: add generic 
mergeconfig target, %.config"

>
>
>
>> As it is common for users like me to pass ARCH variable in command line,
>> providing such flexiblity in merge_config makes more sense.
>>
>> This patch adds support to pass arguments to make file, without this patch the
>> user has to set the enviroment variables which is not explicit.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>
>
>
>
--srini
