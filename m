Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:39515 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751319Ab0DVKVa (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Apr 2010 06:21:30 -0400
Message-ID: <4BD02329.50606@suse.cz>
Date: Thu, 22 Apr 2010 12:21:29 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: subdir-ccflags problem
References: <1271833758.3627.16.camel@jlt3.sipsolutions.net>
In-Reply-To: <1271833758.3627.16.camel@jlt3.sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kbuild@vger.kernel.org

On 21.4.2010 09:09, Johannes Berg wrote:
> Hi,
> 
> When I specify subdir-ccflags in a Makefile, e.g. net/Makefile, but then
> build using M=net/wireless/, kbuild doesn't seem to pick it up.
> 
> To me, that seems like a bug, but to my untrained eye it would appear to
> be quite hard to fix. Thoughts?

For M=, this can't be fixed, because make M=$dir means "build external
module which resides in $dir" (so the parent directories have no
relevance). But even for 'make dir/subdir/' it would be hard to fix :-/.

Michal
