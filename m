Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:33076 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755462Ab0HPUFN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Aug 2010 16:05:13 -0400
Message-ID: <4C6999F9.3060908@suse.cz>
Date: Mon, 16 Aug 2010 22:05:13 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [RFC 1/2] kbuild: genericizes package name
References: <1281934457-4225-1-git-send-email-lacombar@gmail.com> <1281934457-4225-2-git-send-email-lacombar@gmail.com> <4C692795.1020907@suse.cz> <4C692DC0.7020002@suse.cz> <20100816172658.GA7881@merkur.ravnborg.org>
In-Reply-To: <20100816172658.GA7881@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Arnaud Lacombe <lacombar@gmail.com>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Dne 16.8.2010 19:26, Sam Ravnborg napsal(a):
> On Mon, Aug 16, 2010 at 02:23:28PM +0200, Michal Marek wrote:
>> Maybe a cleaner way would be to use the same syntax as for
>> DEFCONFIG_LIST or MODULES, i.e. mark KERNELVERSION specially in the
>> Kconfig file:
>>
>> config KERNELVERSION
>>     string
>>     option version env=
>>
>> and then look for a symbol with this property in kconfig.
> 
> I liked my proposal better - but alas that require some kconfig changes.

Support for 'option version' would also require some kconfig changes.


> I would be glad to receive your opinion on the suggested changes before
> putting too much time on it.

I'm all for rephrasing the texts to not mention "kernel" explicitly. As
for how to tackle the KERNELVERSION symbol - I have no strong opinion
either way. Both approaches would move the knowledge about the exact
symbol name to the Kconfig files, which is good. And the version string
is only used in titlebars and banners, so kconfig does not need to know
the value. I'd leave it up to Arnaud, whichever he finds easier to
implement :-).

Michal
