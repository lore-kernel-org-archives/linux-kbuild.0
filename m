Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:45266 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750813Ab1KDBAG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 3 Nov 2011 21:00:06 -0400
Message-ID: <4EB337DB.4010903@zytor.com>
Date: Thu, 03 Nov 2011 17:54:51 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: Generating unistd_*.h
References: <4E583860.5080603@zytor.com> <20110827101820.GA2990@merkur.ravnborg.org> <4E58D99A.2050400@zytor.com> <4E5D4528.1070307@zytor.com> <4E5D501D.9000604@zytor.com> <4E5D5224.5000400@zytor.com> <4E5E3EA2.2080706@suse.cz> <4E5E6164.8050908@zytor.com>
In-Reply-To: <4E5E6164.8050908@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>

On 08/31/2011 09:29 AM, H. Peter Anvin wrote:
> On 08/31/2011 07:01 AM, Michal Marek wrote:
>>>>
>>>> For reference, putting the following in arch/x86/include/asm/Kbuild does
>>>> *not* work, because $(objtree)/arch/x86/include/asm doesn't exist, and
>>>> so Kbuild generates an invalid path:
>>>>
>>>> objhdr-y += ../generated/asm/unistd_32.h
>>>> objhdr-y += ../generated/asm/unistd_64.h
>>>
>>> Similarly, overriding obj in the same file does not work, because
>>> scripts/Makefile.headersinst uses $(srctree)/$(obj) not
>>> $(srctree)/$(src) ... is that normal/expected?
>>
>> Can you either post a patch or a link to a git tree with your current
>> status?
>>
> 
> git://git.zytor.com/users/hpa/kernel/autogen.git
> 
> Patch attached.
> 
> 	-hpa

OK, trying to crawl back out of my exile into kernel.org cleanup land...
this problem still remains!

	-hpa

