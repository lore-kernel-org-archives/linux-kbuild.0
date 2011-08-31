Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:49797 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751266Ab1HaOBK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 31 Aug 2011 10:01:10 -0400
Message-ID: <4E5E3EA2.2080706@suse.cz>
Date: Wed, 31 Aug 2011 16:01:06 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Generating unistd_*.h
References: <4E583860.5080603@zytor.com> <20110827101820.GA2990@merkur.ravnborg.org> <4E58D99A.2050400@zytor.com> <4E5D4528.1070307@zytor.com> <4E5D501D.9000604@zytor.com> <4E5D5224.5000400@zytor.com>
In-Reply-To: <4E5D5224.5000400@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>

On 30.8.2011 23:12, H. Peter Anvin wrote:
> [Cc: dwmw2]
> 
> On 08/30/2011 02:03 PM, H. Peter Anvin wrote:
>> On 08/30/2011 01:16 PM, H. Peter Anvin wrote:
>>> On 08/27/2011 04:48 AM, H. Peter Anvin wrote:
>>> OK, got things mostly working, but I'm a bit stuck on how to make
>>> headers-install do the right thing.  objhdr-y doesn't seem to deal with
>>> the generated subdirectory very well, and we don't really want the files
>>> *installed* into the generated subdirectory for user space.
>>>
>>> Any suggestions for how to best handle it?
>>
>> For reference, putting the following in arch/x86/include/asm/Kbuild does
>> *not* work, because $(objtree)/arch/x86/include/asm doesn't exist, and
>> so Kbuild generates an invalid path:
>>
>> objhdr-y += ../generated/asm/unistd_32.h
>> objhdr-y += ../generated/asm/unistd_64.h
> 
> Similarly, overriding obj in the same file does not work, because
> scripts/Makefile.headersinst uses $(srctree)/$(obj) not
> $(srctree)/$(src) ... is that normal/expected?

Can you either post a patch or a link to a git tree with your current
status?

Thanks,
Michal
