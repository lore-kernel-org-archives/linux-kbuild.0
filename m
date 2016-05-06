Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:65456 "EHLO
	conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757107AbcEFCMW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 May 2016 22:12:22 -0400
MIME-Version: 1.0
In-Reply-To: <1462435694.44077.9.camel@intel.com>
References: <1462434312-19422-1-git-send-email-yamada.masahiro@socionext.com>
	<1462435694.44077.9.camel@intel.com>
Date: Fri, 6 May 2016 11:12:03 +0900
Message-ID: <CAK7LNAQXqVaGEQVoZ9kJ2_Hvtn5NQQdLfqGrxetbkNRwSZVPog@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix if_change and friends to consider argument order
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Woodhouse, David" <david.woodhouse@intel.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "mmarek@suse.com" <mmarek@suse.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dhowells@redhat.com" <dhowells@redhat.com>

Hi David,


2016-05-05 17:08 GMT+09:00 Woodhouse, David <david.woodhouse@intel.com>:
> On Thu, 2016-05-05 at 16:45 +0900, Masahiro Yamada wrote:
>>
>> This commit fixes arg-check to compare two strings as a whole.
>> $(strip ...) is important because we want to ignore the difference
>> that comes from white-spaces.
>
> Do we?
>
> I can construct a hypothetical situation in which whitespace differs
> and we *do* want it to make a difference (for example I used to sign
> with a key called 'My Signing Key.pem' and now I've changed to use
> 'My  Signing  Key.pem'. (OK, it's a *stupid* example but still...)
>

Have you ever succeeded in passing such a string in Kbuild in the first place?

For example, I added the following line into init/Makefile

CFLAGS_main.o += -DHELLO_WORLD='"hello        world!"'


and

     printk("%s\n", HELLO_WORLD);

to start_kernel().



But, I got the console log

[     0.001639] hello world!




The root cause of this problem is the following line

_c_flags       = $(filter-out $(CFLAGS_REMOVE_$(basetarget).o), $(orig_c_flags))


$(filter-out  ) strips extra spaces, so Kbuild can not keep
white-spaces as they are.


Maybe, we can fix this problem.  (This is another problem, though)

Thank you for spotting this.



-- 
Best Regards
Masahiro Yamada
