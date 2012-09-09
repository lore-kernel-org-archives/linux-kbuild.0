Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ares07.inai.de ([5.9.24.206]:49686 "EHLO seven.medozas.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754782Ab2IIVz5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 9 Sep 2012 17:55:57 -0400
Date: Sun, 9 Sep 2012 23:55:55 +0200 (CEST)
From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: [PATCH] Add mach-specific includes
In-Reply-To: <5040BFF3.6050705@suse.cz>
Message-ID: <alpine.LNX.2.01.1209092355160.22738@frira.zrqbmnf.qr>
References: <1344764843-2179-1-git-send-email-tzafrir.cohen@xorcom.com> <5040BFF3.6050705@suse.cz>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Tzafrir Cohen <tzafrir.cohen@xorcom.com>, Linux Kbuild <linux-kbuild@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, maximilian attems <max@stro.at>


On Friday 2012-08-31 15:45, Michal Marek wrote:
>>  # Build header package
>>  (cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl > "$objtree/debian/hdrsrcfiles")
>>  (cd $srctree; find arch/$SRCARCH/include include scripts -type f >> "$objtree/debian/hdrsrcfiles")
>> +if echo arch/$SRCARCH/mach-*/include | grep q -v '*'; then
>
>This should probably be grep -q, but it's quite ugly anyway.

Use of -q should probably be preferred to >/dev/null,
because with the latter, you will still pay the price
of printf.
