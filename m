Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:63316 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752198Ab0GYIaN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 25 Jul 2010 04:30:13 -0400
MIME-Version: 1.0
In-Reply-To: <4C49601E.5060605@suse.cz>
References: <1279868654-15743-1-git-send-email-bebarino@gmail.com>
	<4C49601E.5060605@suse.cz>
Date: Sun, 25 Jul 2010 11:30:11 +0300
Message-ID: <AANLkTikK71ttjp0-NEyg9JCrj2fO8AdsUjPwqTVFTxV=@mail.gmail.com>
Subject: Re: [PATCH] nconfig: Fix segfault when help contains special
	characters
From: Nir Tzachar <nir.tzachar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Stephen Boyd <bebarino@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

2010/7/23 Michal Marek <mmarek@suse.cz>:
> On 23.7.2010 09:04, Stephen Boyd wrote:
>> nconfig segfaults when help text contains the character '%'. For a quick
>> example, navigate to the kernel compression options and get the help for
>> bzip2. Doing so triggers a call to mvwprintw() with a string containing
>> '%' and no extra arguments to fill in the specifier's value. Fix this
>> case by printing the literal string retrieved from the kconfig.
>
> Thanks, applied.
>
> Michal


Thanks. It is also nice to see people are using nconfig.

Cheers.
