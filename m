Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:32913 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754427Ab0LTPbK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Dec 2010 10:31:10 -0500
Message-ID: <4D0F76BC.3040102@suse.cz>
Date: Mon, 20 Dec 2010 16:31:08 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCHv3] Kbuild: kconfig: Verbose version of --listnewconfig
References: <1291596649.8025.104.camel@localhost>	<4D0F68EF.8080801@suse.cz> <AANLkTikwdbWJ94LkCHTkFhDG6Z_sZ7ijNBb_SAWwjBLD@mail.gmail.com>
In-Reply-To: <AANLkTikwdbWJ94LkCHTkFhDG6Z_sZ7ijNBb_SAWwjBLD@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Ben Hutchings <ben@decadent.org.uk>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org, Debian kernel maintainers <debian-kernel@lists.debian.org>

On 20.12.2010 16:23, Arnaud Lacombe wrote:
> Hi,
> 
> On Mon, Dec 20, 2010 at 9:32 AM, Michal Marek <mmarek@suse.cz> wrote:
>> On 6.12.2010 01:50, Ben Hutchings wrote:
>>> If the KCONFIG_VERBOSE environment variable is set, show the default
>>> values of new symbols and not just their names.
>>>
>>> Based on work by Bastian Blank <waldi@debian.org> and
>>> maximilian attems <max@stro.at>.  Simplified by Michal Marek
>>> <mmarek@suse.cz>.
>>>
>>> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
>>> ---
>>> I believe this incorporates all the comments made on v2.
>>
>> Thanks, applied to kbuild-2.6.git#kconfig.
>>
> Did you look at the factorization and abstraction of I proposed ?

Not yet. OK, I'll have a look at it now and decide what to do. I haven't
pushed out the kbuild tree yet.

Michal
