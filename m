Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qg0-f49.google.com ([209.85.192.49]:34275 "EHLO
	mail-qg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753589AbbCRCFy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Mar 2015 22:05:54 -0400
Received: by qgh62 with SMTP id 62so25957357qgh.1
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Mar 2015 19:05:54 -0700 (PDT)
Message-ID: <5508DD81.20006@cumulusnetworks.com>
Date: Tue, 17 Mar 2015 22:05:53 -0400
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
>
>> +	help
>> +	  Simply enables the gcc compiler option -Werror for the entire
>> +	  build. If a compilation unit cannot handle -Werror by fixing the
>> +	  warning then that unit must suppress the cc warning using
>> +	  cc-disable-warning for that compilation unit in the unit's makefile.
>> +	  .
>
> (Why the dot?)
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

Please note, I was not trying to imply using cc-disable-warning was a 
first resort option, sorry if it seemed like that. In fact in my opinion 
cc-disable-warning should almost never be used. Do you have a suggestion 
for better wording of this?

Some slight background on these patches, they were born out of the team 
here wanting to have a simple way of easily catching warnings during 
driver development. This seemed like the least cumbersome way. I 
understand if defaulting to yes is not advisable.

Will be happy to submit another patch defaulting to no and clean-up the 
Dots in the paragraphs. From the comments provided so far this approach 
would seem to address them, unless I am misunderstanding and in fact the 
general idea of compiling with -Werror is not wanted.

Appreciate the discussion.

-Jon
