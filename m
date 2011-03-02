Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:59228 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755602Ab1CBW7z (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Mar 2011 17:59:55 -0500
Message-ID: <4D6ECBDB.6090307@zytor.com>
Date: Wed, 02 Mar 2011 14:59:39 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: RFC: x86: kill binutils 2.16.x?
References: <4D6E8932.1010405@zytor.com> <alpine.LFD.2.00.1103022152420.2701@localhost6.localdomain6> <4D6EB07C.5040004@zytor.com> <alpine.LFD.2.00.1103022216180.2701@localhost6.localdomain6>
In-Reply-To: <alpine.LFD.2.00.1103022216180.2701@localhost6.localdomain6>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>

On 03/02/2011 01:17 PM, Thomas Gleixner wrote:
> On Wed, 2 Mar 2011, H. Peter Anvin wrote:
> 
>> On 03/02/2011 12:54 PM, Thomas Gleixner wrote:
>>>
>>> Please lets get rid of known to be broken shite instead of trying to
>>> work around it for no good reasons. How old is that crap again ?
>>>
>>
>> 2005-2006.
> 
> Time enough even for enterprise folks to sort that out. Please kill it
> ASAP.
> 
> Thanks,
> 

kbuild people: is there a way to test for a specific assembler version
in Kbuild (and error out the build for it?)

	-hpa
