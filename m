Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:33276 "EHLO mail.zytor.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752512AbcKGWcQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Nov 2016 17:32:16 -0500
Subject: Re: -fno-PIE, take #3
References: <20161104183940.30692-1-bigeasy@linutronix.de>
From: "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <63c356a8-58a3-bc7e-88db-5c8071db15e1@zytor.com>
Date: Mon, 7 Nov 2016 14:31:30 -0800
MIME-Version: 1.0
In-Reply-To: <20161104183940.30692-1-bigeasy@linutronix.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-kernel@vger.kernel.org
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, x86@kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Ben Hutchings <ben@decadent.org.uk>, Sven Joachim <svenjoac@gmx.de>, "Austin S. Hemmelgarn" <ahferroin7@gmail.com>, Borislav Petkov <bp@alien8.de>

On 11/04/16 11:39, Sebastian Andrzej Siewior wrote:
> Debian gcc's is nowdays compiled with --enable-default-pie which means it does
> -fPIE by default. This breaks atleast x86-64 compiles.
> This is the third attempt to fix it, this time by using runtime detection of
> the -fno-PIE compiler switch (it was introduced in gcc 3.4, min required gcc is
> currently 3.2) so it can be backported to the stable kernels.
> As noted by Al this won't fix `git bisect' of stable kernels prio this commit.
> However using always a wrapper around gcc which adds -fno-PIE is not sollution
> I want to rely in future.
> 
> Sebastian
> 

We don't support gcc < 3.4 on x86 platforms; I'm pretty sure it is broken.

	-hpa

