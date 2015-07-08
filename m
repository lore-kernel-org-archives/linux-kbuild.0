Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:35026 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755142AbbGHUSZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Jul 2015 16:18:25 -0400
MIME-Version: 1.0
In-Reply-To: <559CF8BA.90803@fau.de>
References: <cover.1435927467.git.andreas.ruprecht@fau.de>
	<a2424e6c57a4d6c38369c393ba58e0d050b7c130.1435927467.git.andreas.ruprecht@fau.de>
	<CAEMqcmrBWGFGTZXvASDXRtTUtb=5=q-b_9a3A_hQ8RC47zNhUg@mail.gmail.com>
	<559BA09A.2030603@fau.de>
	<20150707144559.GA12760@huvuddator>
	<559CF8BA.90803@fau.de>
Date: Wed, 8 Jul 2015 22:18:24 +0200
Message-ID: <CAEMqcmpA1qNdhRJCzV2R+66hB8Rkfa9-4hMrQ5cjhYdUWD72Rg@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: also warn of unhandled characters in statements
From: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andreas Ruprecht <andreas.ruprecht@fau.de>
Cc: Paul Bolle <pebolle@tiscali.nl>, Valentin Rothberg <valentinrothberg@gmail.com>, rafael.j.wysocki@intel.com, KCONFIG <linux-kbuild@vger.kernel.org>, Kernel Mailing List <linux-kernel@vger.kernel.org>, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net, Michal Marek <mmarek@suse.cz>

On Wed, Jul 8, 2015 at 12:17 PM, Andreas Ruprecht
<andreas.ruprecht@fau.de> wrote:
> Hi,
>
> On 07/07/2015 16:45, Ulf Magnusson wrote:
>>
>> Did you use the (undocumented, obviously :) REGENERATE_PARSERS option,
>> like 'make menuconfig REGENERATE_PARSERS=1'? It's from
>> scripts/Makefile.lib.
>>
>> The following patch works fine for me from some quick experimentation.
>> It's against the mainline kernel, as for some reason I can't clone
>> git://gitorious.org/linux-kconfig/linux-kconfig at the moment.
>
> yep, I used that. After some playing around with it, I also submitted a
> v2 of the patch (although with the '-' still included in the regex for
> PARAMs)

I was only referring to the redunant-'-'-in-PARAM-regex part. Could've made
that clearer. Might be a bit nitpicky I guess.

> , didn't you receive that? (Message-Id:
> <cover.1436264921.git.andreas.ruprecht@fau.de>) and the two patches as
> replies to the cover letter. They are against yesterday's linux-next.
>
> Regards,
>
> Andreas

Cheers,
Ulf
