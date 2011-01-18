Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:35593 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751821Ab1ARPA2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Jan 2011 10:00:28 -0500
Received: by bwz15 with SMTP id 15so3435185bwz.19
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Jan 2011 07:00:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4D356FB9.7040807@suse.cz>
References: <AANLkTi=FYc=o04qZUoOT9u=7YMkqu-mtxT=EeJvR3iVg@mail.gmail.com>
	<4D3431CF.5070407@suse.cz>
	<AANLkTi=wkCsaeouJ=92v62JU7cfLQuDQ-nQoEMOuzep4@mail.gmail.com>
	<201101172350.26646.yann.morin.1998@anciens.enib.fr>
	<4D356FB9.7040807@suse.cz>
Date: Tue, 18 Jan 2011 15:59:57 +0100
Message-ID: <AANLkTinMd0GJiczZJeW_YjHsJor3pw0KWG0tz=JxpmHR@mail.gmail.com>
Subject: Re: Where is the end of "menuconfig" entry scope?
From: Filip Honckiewicz <f.honckiewicz@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

2011/1/18 Michal Marek <mmarek@suse.cz>:
> On 17.1.2011 23:50, Yann E. MORIN wrote:
>> Filip, All,
>>
>> On Monday 17 January 2011 23:39:17 Filip Honckiewicz wrote:
>>> It helped me a lot and now it's clear. Your example shows everything.
>>> In kconfig-language.txt there is:
>>>  "This is similar to the simple config entry above, but it also gives
>>> a hint to front ends, that all suboptions should be displayed as a
>>> separate list of options." and this "suboptions" fool me that if
>>> there're suboptions than there has to be ending of menuconfig entry;)
>>
>> Maybe expressing this in a more understandable way, such as:
>>
>>   The menuconfig scope ends with the last config options that depends
>>   on that menuconfig entry.
>
> Then such sentence would have to be added to "config" as well. Or just
> point people to the Menu structure chapter.
>
> Michal
>

I agree with Michal. It makes no sense. But maybe remove "suboptions"
and change whole sentence to something like this:
"This is similar to the simple config entry above, but it also gives a
hint to front ends, that all other options that depends on this entry
should be displayed as a
separate list of options."

and maybe add Michal's example to "Menu structure" chapter to show
this little difference between config and menuconfig. Or maybe not;)

Sorry for my english.
Filip
