Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:64465 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753807Ab0KYQ2k (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 25 Nov 2010 11:28:40 -0500
MIME-Version: 1.0
In-Reply-To: <4CEE84B1.4070301@suse.cz>
References: <20101029054310.790179545@goodmis.org>
	<20101029054423.498608001@goodmis.org>
	<AANLkTi=a8dp-WUNHAkx2fZ5GgNHmDw+ee7MDeUSL44Z0@mail.gmail.com>
	<1288402042.29632.50.camel@gandalf.stny.rr.com>
	<AANLkTi=JXFppmiyyo=Hc614=FpDhOO4h8SLTs=CUOvQv@mail.gmail.com>
	<1289263747.12418.78.camel@gandalf.stny.rr.com>
	<4CEE84B1.4070301@suse.cz>
Date: Thu, 25 Nov 2010 11:21:51 -0500
Message-ID: <AANLkTinZtnyL9CX8yHyXGN6S_2OHSEC-oJ_+eyNRApwE@mail.gmail.com>
Subject: Re: [PATCH 1/5] [PATCH 1/5] kconfig: Make localmodconfig handle
 environment variables
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>

Hi,

On Thu, Nov 25, 2010 at 10:45 AM, Michal Marek <mmarek@suse.cz> wrote:
> What information does localmodconfig need? A list of config options and
> their computed dependencies and a flag for each option if it has prompt,
> anything else? So a scripts/kconfig/conf --dump-kconfig that would
> produce such flat list should suffice, without the complexity of having
> to build a perl binding first (and would be usable from bash/awk/python
> scripts as well). What do you think?
>
Just as a FYI, the output of zconfdump() does not respect the kconfig
syntax. I've got some patches to fix that, but I've not been able to
touch them since a few weeks now.

 - Arnaud
