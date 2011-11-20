Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:45317 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753688Ab1KTSCc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 20 Nov 2011 13:02:32 -0500
Received: by wwe5 with SMTP id 5so8960146wwe.1
        for <linux-kbuild@vger.kernel.org>; Sun, 20 Nov 2011 10:02:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4EC93B56.4020403@xenotime.net>
References: <4E98B845.8050009@xenotime.net>
	<CACqU3MXzypsug0kJ5kc1orFcp29Bmqm=C7_6pq6s3C6K=cKXLg@mail.gmail.com>
	<4E991F9E.2020303@xenotime.net>
	<CACqU3MXo0xPWXZoZESCiuBSeEOF5-SQvsQa9cPVRX1ywFTm45w@mail.gmail.com>
	<4EBD537C.9070908@xenotime.net>
	<4EC907D0.5040104@suse.cz>
	<4EC93B56.4020403@xenotime.net>
Date: Sun, 20 Nov 2011 13:02:31 -0500
Message-ID: <CACqU3MWExLVdObP0+9_bSR9HtZpJMi1573cmjcD0nUHAYRrLrA@mail.gmail.com>
Subject: Re: strange build failure when kconfig symbol is bool but not when tristate
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Michal Marek <mmarek@suse.cz>, linux kbuild list <linux-kbuild@vger.kernel.org>

Hi,

On Sun, Nov 20, 2011 at 12:39 PM, Randy Dunlap <rdunlap@xenotime.net> wrote:
> On 11/20/2011 05:59 AM, Michal Marek wrote:
>> On 11.11.2011 17:55, Randy Dunlap wrote:
>>> On 10/14/2011 11:08 PM, Arnaud Lacombe wrote:
>>>> Hi,
>>>>
>>>> On Sat, Oct 15, 2011 at 1:52 AM, Randy Dunlap <rdunlap@xenotime.net> wrote:
>>>>> On 10/14/2011 10:39 PM, Arnaud Lacombe wrote
>>>>>> There was something like this not too long ago, does this:
>>>>>>
>>>>>> https://github.com/lacombar/linux-2.6/tree/master/kconfig/expr-woes
>>>>>>
>>>>>> helps ?
>>>>>
>>>>> Am I supposed to use that full kernel tree?
>>>>> Can I just get a patch to test?
>>>>>
>>>> You can merge that with whatever kernel tree. Sending the proper patch
>>>> has been on my TODO for a while
>>>
>>> Can we get a testable patch for this?
>>> or can we get this merged into linux-next so that I can test it?
>>
>> You can do
>> $ git checkout -b kconfig-test v3.1
>> $ git pull git://github.com/lacombar/linux-2.6.git master/kconfig/expr-woes
>
> Thanks, did that, but it would have gone a lot easier and faster IMHO
> if a patch could have been posted.
>
sorry, I've been quite busy by $WORK in the past two month, didn't had
much time to hack around kconfig beside the original work I did to
investigate the issue.

>> and test if your bug is fixed.
>
> Acked-and-tested-by: Randy Dunlap <rdunlap@xenotime.net>
>
ok, thanks. I still need to re-work the commit logs and Sign-off the
set. Hopefully with a shorter ETA :)

 - Arnaud
