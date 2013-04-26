Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:63070 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751103Ab3DZKhp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 26 Apr 2013 06:37:45 -0400
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
In-Reply-To: <CA+icZUVOfB2JuL1xh1EO1hTP_eOkntYFKsUJ0Zp6VZqn09NABA@mail.gmail.com>
References: <20130426180357.7599d1b6b7965470905dcdf3@canb.auug.org.au>
	<CA+icZUWt_W5FUQgQ2TFoQU0df+sAbxZZE8AcD16T3f_fiTD9DQ@mail.gmail.com>
	<517A4FC1.3070605@suse.cz>
	<20130426100435.GA28733@sepie.suse.cz>
	<CA+icZUVOfB2JuL1xh1EO1hTP_eOkntYFKsUJ0Zp6VZqn09NABA@mail.gmail.com>
Date: Fri, 26 Apr 2013 12:37:43 +0200
Message-ID: <CA+icZUWNVEsiTs6u_2R9krb45ub4t-pZj_VEPRmrX2c4DzwfmA@mail.gmail.com>
Subject: Re: linux-next: Tree for Apr 26
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>

On Fri, Apr 26, 2013 at 12:35 PM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> On Fri, Apr 26, 2013 at 12:04 PM, Michal Marek <mmarek@suse.cz> wrote:
>> On Fri, Apr 26, 2013 at 11:58:25AM +0200, Michal Marek wrote:
>>> Can you send a copy of your .config?
>>
>> I can reproduce it as well:
>>
>> $ yes "" | make oldconfig
>> ...
>>   Enumeration method [M/y/?] (NEW)
>>     Basic (RAPIDIO_ENUM_BASIC) [N/m/?] n
>> ...
>> #
>> # configuration written to .config
>> #
>> $ make oldconfig
>> ...
>>   Enumeration method [M/y/?] (NEW)
>>
>>
>> .config is attached.
>>
>
> Mine, too.
>
> I hoped that -next release will be one w/o troubles
> (cpufreq/intel_pstate / pm/timekeeping / ipc-sem-from-mmotm).
> Unfortunately, I am not lucky :-(.
>
> Anyway, waiting for a fix.
>

Just FYI: Mail delivery troubles!

Delivery to the following recipient failed permanently:

     yann.morin.1998@free.fr

Technical details of permanent failure:
Google tried to deliver your message, but it was rejected by the
server for the recipient domain free.fr by mx1.free.fr. [212.27.48.6].

The error that the other server returned was:
550 spam detected
...

- Sedat -

> - Sedat -
>
>> Michal
