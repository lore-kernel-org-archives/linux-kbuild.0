Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qc0-f175.google.com ([209.85.216.175]:33420 "EHLO
	mail-qc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751000AbbCQXPC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Mar 2015 19:15:02 -0400
Received: by qcyi15 with SMTP id i15so24222066qcy.0
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Mar 2015 16:15:01 -0700 (PDT)
Message-ID: <5508B574.5030505@cumulusnetworks.com>
Date: Tue, 17 Mar 2015 19:15:00 -0400
From: Jonathan Toppins <jtoppins@cumulusnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH v1 kbuild for-next 1/2] makefiles: add config option to
 force all cc warnings to errors
References: <1426631862-19563-1-git-send-email-jtoppins@cumulusnetworks.com> <1426633120.15575.17.camel@x220>
In-Reply-To: <1426633120.15575.17.camel@x220>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On 3/17/15 6:58 PM, Paul Bolle wrote:
> On Tue, 2015-03-17 at 15:37 -0700, Jonathan Toppins wrote:
>> --- a/lib/Kconfig.debug
>> +++ b/lib/Kconfig.debug
>> +config DEBUG_FORCE_CC_WARNINGS_TO_ERRORS
>> +	bool "Force cc warnings to errors"
>> +	default y
>
> No way.

So default to "n"?

>
>> +	help
>> +	  Simply enables the gcc compiler option -Werror for the entire
>> +	  build. If a compilation unit cannot handle -Werror by fixing the
>> +	  warning then that unit must suppress the cc warning using
>> +	  cc-disable-warning for that compilation unit in the unit's makefile.
>> +	  .
>
> (Why the dot?)

I am probably confusing the need for the dot in Debian control files 
with Kconfig files. Kconfig bases paragraph continuation on indention, 
correct?

>
>> +	  This option is intended to be more in the developer's face and
>> +	  encourage effort of some kind to remove the compilation warning.
>> +	  .
>
> (Dot?)
>
>> +	  If unsure say y.
>
> Again, no way.
>
>> +
>>   endmenu # "Compiler options"
>>
>>   config MAGIC_SYSRQ
>
> Feel free to fix as many build warning as you can. I'd really appreciate
> that. But my x86_64 build of v4.0-rc4 is _almost_ warning free. And
> that's nice. And I find -Werror (and littering Makefiles with
> cc-disable-warning) just to remove the few warnings I still see plain
> silly. I'm sure the same holds for other people and their builds too.
>
> (This can be summarized as: NAK.)
>
>
> Paul Bolle
>

Appreciate the review thanks.

-Jon
