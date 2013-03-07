Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:49708 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753177Ab3CGN3c (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Mar 2013 08:29:32 -0500
Message-ID: <513895F9.2050900@windriver.com>
Date: Thu, 7 Mar 2013 08:28:25 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: Re: make headers_install fail when path is too long
References: <51372591.1090606@6wind.com> <20130306161026.GA13449@merkur.ravnborg.org> <51376E6C.4040903@6wind.com> <51384F21.9070800@suse.cz>
In-Reply-To: <51384F21.9070800@suse.cz>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: nicolas.dichtel@6wind.com, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org

On 13-03-07 03:26 AM, Michal Marek wrote:
> Dne 6.3.2013 17:27, Nicolas Dichtel napsal(a):
>> -        $(PERL) $< $(installdir) $(SRCARCH) $(input-files); \
> [...]
>> +    @echo $(input-files) > $(INSTALL_HDR_PATH)/.input-files
>
> Are you sure this is a reliable fix? What make does is to spawn
>
> /bin/sh -c 'echo <long list of files> > usr/include/.input-files'

It's what I was referencing in my original email. It works here,
and fixes our install of headers in previously failing environments.
But yes, it does shuffle the args enough to get around the limit, but
there's still a way to have even deeper and longer path names that
could cause failures.

I experimented with loops, and other options as well. But any
construct like "for f in $(input-files)", is both slow and explodes
on the argument length limits just like the original.

>
> here. So I guess that it works for you just because "sh -c" is shorter
> than "sh -c 'perl scripts/headers_install.pl...'".

Partly, yes, but we are more than a few characters over the limit
in my testing. So it shouldn't be the whole story.

Cheers,

Bruce

>
> Michal
>

