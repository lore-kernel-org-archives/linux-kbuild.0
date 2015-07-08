Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx-rz-1.rrze.uni-erlangen.de ([131.188.11.20]:39054 "EHLO
	mx-rz-1.rrze.uni-erlangen.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932996AbbGHKRd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Jul 2015 06:17:33 -0400
Message-ID: <559CF8BA.90803@fau.de>
Date: Wed, 08 Jul 2015 12:17:30 +0200
From: Andreas Ruprecht <andreas.ruprecht@fau.de>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] kconfig: also warn of unhandled characters in statements
References: <cover.1435927467.git.andreas.ruprecht@fau.de> <a2424e6c57a4d6c38369c393ba58e0d050b7c130.1435927467.git.andreas.ruprecht@fau.de> <CAEMqcmrBWGFGTZXvASDXRtTUtb=5=q-b_9a3A_hQ8RC47zNhUg@mail.gmail.com> <559BA09A.2030603@fau.de> <20150707144559.GA12760@huvuddator>
In-Reply-To: <20150707144559.GA12760@huvuddator>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Cc: Paul Bolle <pebolle@tiscali.nl>, Valentin Rothberg <valentinrothberg@gmail.com>, rafael.j.wysocki@intel.com, KCONFIG <linux-kbuild@vger.kernel.org>, Kernel Mailing List <linux-kernel@vger.kernel.org>, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net, Michal Marek <mmarek@suse.cz>

Hi,

On 07/07/2015 16:45, Ulf Magnusson wrote:
> 
> Did you use the (undocumented, obviously :) REGENERATE_PARSERS option,
> like 'make menuconfig REGENERATE_PARSERS=1'? It's from
> scripts/Makefile.lib.
> 
> The following patch works fine for me from some quick experimentation.
> It's against the mainline kernel, as for some reason I can't clone
> git://gitorious.org/linux-kconfig/linux-kconfig at the moment.

yep, I used that. After some playing around with it, I also submitted a
v2 of the patch (although with the '-' still included in the regex for
PARAMs), didn't you receive that? (Message-Id:
<cover.1436264921.git.andreas.ruprecht@fau.de>) and the two patches as
replies to the cover letter. They are against yesterday's linux-next.

Regards,

Andreas
