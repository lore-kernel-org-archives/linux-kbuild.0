Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ew0-f207.google.com ([209.85.219.207]:52098 "EHLO
	mail-ew0-f207.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755065AbZKDKAs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Nov 2009 05:00:48 -0500
Message-ID: <4AF150D2.6000207@tuffmail.co.uk>
Date: Wed, 04 Nov 2009 10:00:50 +0000
From: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
MIME-Version: 1.0
Subject: Re: [PATCH 05/10] kbuild: sort the list of symbols exported by the
 kernel (__ksymtab)
References: <9b2b86520911020852q49c55695rb05d87090fa9ad33@mail.gmail.com> <1257242782-10496-6-git-send-email-alan-jenkins@tuffmail.co.uk> <200911041849.43311.rusty@rustcorp.com.au>
In-Reply-To: <200911041849.43311.rusty@rustcorp.com.au>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: greg@kroah.com, linux-kbuild@vger.kernel.org, carmelo73@gmail.com, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Mike Frysinger <vapier.adi@gmail.com>

Rusty Russell wrote:
> On Tue, 3 Nov 2009 08:36:17 pm Alan Jenkins wrote:
>   
>> +/*
>> + * We use CPP macros since they are more familiar than assembly macros.
>> + * Note that CPP macros eat newlines, so each statement must be terminated
>> + * by a semicolon.
>> + */
>> +
>> +#ifdef CONFIG_HAVE_SYMBOL_PREFIX
>> +#define __SYM(sym) _##sym
>> +#else
>> +#define __SYM(sym) sym
>> +#endif
>>     
>
> Ideally, you would used MODULE_SYMBOL_PREFIX here, but of course it's a
> string.  I don't think Kconfig can do arbitrary identifiers, so we can't
> make CONFIG_SYMBOL_PREFIX empty or _.
>
> Perhaps clarify it to a bool CONFIG_HAVE_MODULE_UNDERSCORE_PREFIX then,
> since that's what you're assuming here?
>
> Thanks,
> Rusty.

I made the same assumption in patch 4.  The arch defines 
CONFIG_HAVE_SYMBOL_PREFIX, which then causes init/Kconfig to define 
CONFIG_SYMBOL_PREFIX="_".

Mike suggested that I hack kbuild instead, to do something like

unquote = ...
AFLAGS_.tmp_export-asm.o += -DSYMBOL_PREFIX=$(unquote CONFIG_SYMBOL_PREFIX)

I'm experimenting with the idea, but I haven't managed to get it working 
yet.

Alan
