Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:52362 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756731Ab1H3VDc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 30 Aug 2011 17:03:32 -0400
Message-ID: <4E5D501D.9000604@zytor.com>
Date: Tue, 30 Aug 2011 14:03:25 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: Generating unistd_*.h
References: <4E583860.5080603@zytor.com> <20110827101820.GA2990@merkur.ravnborg.org> <4E58D99A.2050400@zytor.com> <4E5D4528.1070307@zytor.com>
In-Reply-To: <4E5D4528.1070307@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

On 08/30/2011 01:16 PM, H. Peter Anvin wrote:
> On 08/27/2011 04:48 AM, H. Peter Anvin wrote:
>> On 08/27/2011 03:18 AM, Sam Ravnborg wrote:
>>>>
>>>> 1. Is there a better place than others to put these generated files
>>>>    (i.e. other than $(obj)/arch/x86/include/asm)?
>>> $(obj)/arch/x86/include/generated
>>>
>>> This is what generic-y supports uses.
>>>
> 
> OK, got things mostly working, but I'm a bit stuck on how to make
> headers-install do the right thing.  objhdr-y doesn't seem to deal with
> the generated subdirectory very well, and we don't really want the files
> *installed* into the generated subdirectory for user space.
> 
> Any suggestions for how to best handle it?
> 

For reference, putting the following in arch/x86/include/asm/Kbuild does
*not* work, because $(objtree)/arch/x86/include/asm doesn't exist, and
so Kbuild generates an invalid path:

objhdr-y += ../generated/asm/unistd_32.h
objhdr-y += ../generated/asm/unistd_64.h

	-hpa
