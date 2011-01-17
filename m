Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:64960 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753077Ab1AQWjS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 17 Jan 2011 17:39:18 -0500
Received: by bwz15 with SMTP id 15so2844628bwz.19
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Jan 2011 14:39:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4D3431CF.5070407@suse.cz>
References: <AANLkTi=FYc=o04qZUoOT9u=7YMkqu-mtxT=EeJvR3iVg@mail.gmail.com>
	<4D3431CF.5070407@suse.cz>
Date: Mon, 17 Jan 2011 23:39:17 +0100
Message-ID: <AANLkTi=wkCsaeouJ=92v62JU7cfLQuDQ-nQoEMOuzep4@mail.gmail.com>
Subject: Re: Where is the end of "menuconfig" entry scope?
From: Filip Honckiewicz <f.honckiewicz@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

2011/1/17 Michal Marek <mmarek@suse.cz>:
> On 15.1.2011 22:35, Filip Honckiewicz wrote:
>> I just want to ask you - Great Developers - where is the end of
>> "menuconfig" entry scope? I read kconfig-language.txt, but there are
>> some lacks in documentation, so I don't know which (and why?)
>> suboption is the last suboption of menuconfig. Is this defined by end
>> of Kconfig file or what?
>
> "menuconfig" does not start a block, semantically it is equivalent to
> "config". Kconfig is able to derive the menu structure from
> dependencies, see "Menu structure" in kconfig-language.txt,
> config/menuconfig only influence how the resulting menu is rendered in
> the frontends. E.g. 'make nconfig' and 'make menuconfig' frontends
> display the menu like
>
> [*] Foo
> [ ]   Bar
> [ ]   Baz
>
> if Foo is "config", and
>
> [*] Foo  --->
> (Bar and Baz hidden in the submenu)
>
> if Foo is "menuconfig".
>
> hth,
> Michal
>

Thanks!

It helped me a lot and now it's clear. Your example shows everything.
In kconfig-language.txt there is:
 "This is similar to the simple config entry above, but it also gives
a hint to front ends, that all suboptions should be displayed as a
separate list of options." and this "suboptions" fool me that if
there're suboptions than there has to be ending of menuconfig entry;)

Filip
