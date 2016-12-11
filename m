Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:39875 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751795AbcLKLPt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Dec 2016 06:15:49 -0500
Date: Sun, 11 Dec 2016 12:15:47 +0100
From: Michal Marek <mmarek@suse.com>
Subject: Re: [PATCH] make use of make variable CURDIR instead of calling pwd
Message-ID: <20161211111547.GD30135@sepie.suse.cz>
References: <20161122083026.6345-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20161122083026.6345-1-uwe@kleine-koenig.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc: kernel@pengutronix.de, linux-kbuild@vger.kernel.org, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>

On Tue, Nov 22, 2016 at 09:30:26AM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> make already provides the current working directory in a variable, so make
> use of it instead of forking a shell. Also replace usage of PWD by
> CURDIR. PWD is provided by most shells, but not all, so this makes the
> build system more robust.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> BTW, the comment "set up PWD so that older versions of make will work
> with our build." in tools/power/cpupower/Makefile is wrong. PWD is a
> variable provided by most modern shells, so it has nothing to do with
> old make.
> 
> I don't know where to send this patch, so I picked the kbuild entry from
> MAINTAINERS as best match. If you think there is a better alternative or
> this patch needs splitting, please tell me.

I applied it to the kbuild tree. If conflicts happen, their resolution
should be straightforward.

Michal
