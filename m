Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]:56275 "EHLO
	master.linux-sh.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751665Ab0HXGda (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Aug 2010 02:33:30 -0400
Date: Tue, 24 Aug 2010 15:33:28 +0900
From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: [PATCH] sh: fix kconfig warning
Message-ID: <20100824063327.GA7384@linux-sh.org>
References: <1282579872-16609-1-git-send-email-lacombar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1282579872-16609-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>, linux-sh <linux-sh@vger.kernel.org>

On Mon, Aug 23, 2010 at 12:11:12PM -0400, Arnaud Lacombe wrote:
> warning: (SUPERH32) selects HAVE_HW_BREAKPOINT which has unmet direct dependencies (PERF_EVENTS)
> 
> This warning was causing Kconfig to segfault.
> 
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>

This was already fixed by Sam, thanks anyways.
