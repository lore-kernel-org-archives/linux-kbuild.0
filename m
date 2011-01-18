Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:49688 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752011Ab1ARKrY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Jan 2011 05:47:24 -0500
Message-ID: <4D356FB9.7040807@suse.cz>
Date: Tue, 18 Jan 2011 11:47:21 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Where is the end of "menuconfig" entry scope?
References: <AANLkTi=FYc=o04qZUoOT9u=7YMkqu-mtxT=EeJvR3iVg@mail.gmail.com> <4D3431CF.5070407@suse.cz> <AANLkTi=wkCsaeouJ=92v62JU7cfLQuDQ-nQoEMOuzep4@mail.gmail.com> <201101172350.26646.yann.morin.1998@anciens.enib.fr>
In-Reply-To: <201101172350.26646.yann.morin.1998@anciens.enib.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Cc: linux-kbuild@vger.kernel.org, Filip Honckiewicz <f.honckiewicz@gmail.com>

On 17.1.2011 23:50, Yann E. MORIN wrote:
> Filip, All,
> 
> On Monday 17 January 2011 23:39:17 Filip Honckiewicz wrote:
>> It helped me a lot and now it's clear. Your example shows everything.
>> In kconfig-language.txt there is:
>>  "This is similar to the simple config entry above, but it also gives
>> a hint to front ends, that all suboptions should be displayed as a
>> separate list of options." and this "suboptions" fool me that if
>> there're suboptions than there has to be ending of menuconfig entry;)
> 
> Maybe expressing this in a more understandable way, such as:
> 
>   The menuconfig scope ends with the last config options that depends
>   on that menuconfig entry.

Then such sentence would have to be added to "config" as well. Or just
point people to the Menu structure chapter.

Michal
