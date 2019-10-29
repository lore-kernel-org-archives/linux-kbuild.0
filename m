Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:55002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727320AbfJ2JJp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Oct 2019 05:09:45 -0400
Date: Tue, 29 Oct 2019 05:09:41 -0400
From: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.3 50/89] kbuild: fix build error of 'make
 nsdeps' in clean tree
Message-ID: <20191029090941.GK1554@sasha-vm>
References: <20191018220324.8165-1-sashal@kernel.org>
 <20191018220324.8165-50-sashal@kernel.org>
 <CAK7LNARovn6jNGUBQbn-0KbwsCfC6GHE-ybqHDvRUXiCCDuMZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAK7LNARovn6jNGUBQbn-0KbwsCfC6GHE-ybqHDvRUXiCCDuMZA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, Matthias Maennich <maennich@google.com>, Jessica Yu <jeyu@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sat, Oct 19, 2019 at 09:14:13AM +0900, Masahiro Yamada wrote:
>On Sat, Oct 19, 2019 at 7:04 AM Sasha Levin <sashal@kernel.org> wrote:
>>
>> From: Masahiro Yamada <yamada.masahiro@socionext.com>
>>
>> [ Upstream commit d85103ac78a6d8573b21348b36f4cca2e1839a31 ]
>>
>> Running 'make nsdeps' in a clean source tree fails as follows:
>>
>> $ make -s clean; make -s defconfig; make nsdeps
>>    [ snip ]
>> awk: fatal: cannot open file `init/modules.order' for reading (No such file or directory)
>> make: *** [Makefile;1307: modules.order] Error 2
>> make: *** Deleting file 'modules.order'
>> make: *** Waiting for unfinished jobs....
>>
>> The cause of the error is 'make nsdeps' does not build modules at all.
>> Set KBUILD_MODULES to fix it.
>>
>> Reviewed-by: Matthias Maennich <maennich@google.com>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> Signed-off-by: Jessica Yu <jeyu@kernel.org>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>
>nsdeps was introduced in v5.4
>
>Please do not backport this commit.

I've dropped it everywhere, thank you.

-- 
Thanks,
Sasha
