Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vostochny.stro.at ([78.47.22.85]:41098 "EHLO vostochny.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751666Ab1ARLYV (ORCPT <rfc822;linux-kbuild@VGER.KERNEL.ORG>);
	Tue, 18 Jan 2011 06:24:21 -0500
Date: Tue, 18 Jan 2011 12:24:13 +0100
From: maximilian attems <max@stro.at>
Subject: Re: [PATCH] Fix for scripts/builddeb (non-x86, and with output
 option)
Message-ID: <20110118112413.GA12794@stro.at>
References: <4D34C237.306@eecg.toronto.edu>
 <4D34C38F.70807@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4D34C38F.70807@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Livio Soares <livio@eecg.toronto.edu>, Theodore Ts'o <tytso@mit.edu>, linux-kbuild@vger.kernel.org

On Mon, 17 Jan 2011, Michal Marek wrote:

> > Date: Mon, 17 Jan 2011 15:29:06 -0500
> > Subject: [PATCH] Two fixes to builddeb script, regarding the built of header package:
> > 
> > 1) Previous behavior assumed the build was executed inside the
> >    source tree (no 'O=' option).

this seems worthwile, but didn't check the implementation detail.

> > 2) Previous behavior assumed 'x86' architecture.

this is fixed in linux-kbuild.git

could you please repost on top of latest, thank you.

-- 
maks
