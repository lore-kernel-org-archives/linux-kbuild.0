Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:37815 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752788Ab0HPMvE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Aug 2010 08:51:04 -0400
MIME-Version: 1.0
In-Reply-To: <4C6931C4.4000505@suse.cz>
References: <AANLkTim2mi0wbJJl17OkbCJbRt-s5phR4sumn5GsJKUp@mail.gmail.com>
	<20100621120613.86cad1a4.akpm@linux-foundation.org>
	<4C1FC35C.8090201@suse.cz>
	<AANLkTil2-YNAa-jyOYD4cNtbJQ1XQJ6-v3iJ6wxpz7br@mail.gmail.com>
	<AANLkTinC6Sqs7W--=14nmJFDcTS4HQn0=ysn7VhYDDX6@mail.gmail.com>
	<adaocdg3fng.fsf@roland-alpha.cisco.com>
	<20100805222623.39A3240208@magilla.sf.frob.com>
	<AANLkTikvRqTR6TjP9H4-_RHhax24YRPv9PCxn165RTWs@mail.gmail.com>
	<4C613627.1090907@suse.cz>
	<AANLkTimncLdNZCcpcEi9M7-jCuw5FE+xDT7v5--ByfMn@mail.gmail.com>
	<4C6931C4.4000505@suse.cz>
Date: Mon, 16 Aug 2010 22:51:02 +1000
Message-ID: <AANLkTik64kgnUvX896q2E3Xk8Hb9KAH73Run2pMdJ8mk@mail.gmail.com>
Subject: Re: [PATCH] Fix CONFIG_CROSS_COMPILE issue in .config
From: Andrew Hendry <andrew.hendry@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Yegor Yefremov <yegorslists@googlemail.com>, Roland McGrath <roland@redhat.com>, Roland Dreier <rdreier@cisco.com>, Tiago Maluta <tiago.maluta@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Thanks Michal, can see the problem now.
Not sure how the "n" got there, i didn't set it manually.
Was at 2.6.35-rc6 then updated to 2.6.36-rc1 taking the defaults for
all the new config options that popped up.

On Mon, Aug 16, 2010 at 10:40 PM, Michal Marek <mmarek@suse.cz> wrote:
> Dne 16.8.2010 14:35, Andrew Hendry napsal(a):
>> This gives some errors on my ubuntu build for -rc1, reverting lets it
>> build normally. Am I missing something?
>>
>> ahendry@ubuntu:~/linux/linux-2.6$ make
>> make: ngcc: Command not found
>>   CHK     include/linux/version.h
>>   CHK     include/generated/utsrelease.h
>>   CC      kernel/bounds.s
>> /bin/sh: ngcc: not found
>> make[1]: *** [kernel/bounds.s] Error 127
>> make: *** [prepare0] Error 2
>>
>> .config has CONFIG_CROSS_COMPILE="n"
>
> CONFIG_CROSS_COMPILE is a string option, leave it empty if you are not
> cross compiling.
>
> Michal.
>
