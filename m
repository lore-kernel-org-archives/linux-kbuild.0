Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:35761 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751454Ab1KTN7m (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 20 Nov 2011 08:59:42 -0500
Message-ID: <4EC907D0.5040104@suse.cz>
Date: Sun, 20 Nov 2011 14:59:44 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: strange build failure when kconfig symbol is bool but not when
 tristate
References: <4E98B845.8050009@xenotime.net>	<CACqU3MXzypsug0kJ5kc1orFcp29Bmqm=C7_6pq6s3C6K=cKXLg@mail.gmail.com>	<4E991F9E.2020303@xenotime.net> <CACqU3MXo0xPWXZoZESCiuBSeEOF5-SQvsQa9cPVRX1ywFTm45w@mail.gmail.com> <4EBD537C.9070908@xenotime.net>
In-Reply-To: <4EBD537C.9070908@xenotime.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Arnaud Lacombe <lacombar@gmail.com>, linux kbuild list <linux-kbuild@vger.kernel.org>

On 11.11.2011 17:55, Randy Dunlap wrote:
> On 10/14/2011 11:08 PM, Arnaud Lacombe wrote:
>> Hi,
>>
>> On Sat, Oct 15, 2011 at 1:52 AM, Randy Dunlap <rdunlap@xenotime.net> wrote:
>>> On 10/14/2011 10:39 PM, Arnaud Lacombe wrote
>>>> There was something like this not too long ago, does this:
>>>>
>>>> https://github.com/lacombar/linux-2.6/tree/master/kconfig/expr-woes
>>>>
>>>> helps ?
>>>
>>> Am I supposed to use that full kernel tree?
>>> Can I just get a patch to test?
>>>
>> You can merge that with whatever kernel tree. Sending the proper patch
>> has been on my TODO for a while
> 
> Can we get a testable patch for this?
> or can we get this merged into linux-next so that I can test it?

You can do
$ git checkout -b kconfig-test v3.1
$ git pull git://github.com/lacombar/linux-2.6.git master/kconfig/expr-woes

and test if your bug is fixed.

Michal
