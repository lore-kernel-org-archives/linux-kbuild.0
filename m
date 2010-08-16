Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:43052 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751680Ab0HPMX3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Aug 2010 08:23:29 -0400
Message-ID: <4C692DC0.7020002@suse.cz>
Date: Mon, 16 Aug 2010 14:23:28 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [RFC 1/2] kbuild: genericizes package name
References: <1281934457-4225-1-git-send-email-lacombar@gmail.com> <1281934457-4225-2-git-send-email-lacombar@gmail.com> <4C692795.1020907@suse.cz>
In-Reply-To: <4C692795.1020907@suse.cz>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Dne 16.8.2010 13:57, Michal Marek napsal(a):
> Dne 16.8.2010 06:54, Arnaud Lacombe napsal(a):
>> -	sym = sym_lookup("KERNELVERSION", 0);
>> +	sym = sym_lookup("PROJECTVERSION", 0);
> 
> The required change to the top-level Makefile is missing. I suggest you
> rather replace "KERNELVERSION" with a macro defaulting to
> "KERNELVERSION", so that we don't have to change it in the Makefile and
> other scripts.

Maybe a cleaner way would be to use the same syntax as for
DEFCONFIG_LIST or MODULES, i.e. mark KERNELVERSION specially in the
Kconfig file:

config KERNELVERSION
    string
    option version env=

and then look for a symbol with this property in kconfig.

Michal
