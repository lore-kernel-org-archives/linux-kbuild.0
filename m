Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from tex.lwn.net ([70.33.254.29]:35459 "EHLO vena.lwn.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751984AbcDZJ7p (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2016 05:59:45 -0400
Date: Tue, 26 Apr 2016 03:59:39 -0600
From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 0/2] moves samples out of Documentation directory
Message-ID: <20160426035939.51649686@lwn.net>
In-Reply-To: <1461600189-2207716-1-git-send-email-arnd@arndb.de>
References: <1461600189-2207716-1-git-send-email-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Hans Verkuil <hans.verkuil@cisco.com>

On Mon, 25 Apr 2016 18:03:07 +0200
Arnd Bergmann <arnd@arndb.de> wrote:

> As suggested by Nicolas Pitre, here is a resend of two patches to
> move the kernel modules from Documentation/*/ to samples/*/.
> 
> With Nico's changes in place, it's no longer necessary to do this,
> but it seems like a good idea anyway for consistency.
> Not sure who would be the best person to pick up the patches, I'd
> probably either the Documentation or the kbuild maintainers.
> 
> 	Arnd
> 
> [PATCH v2 1/2] samples: connector: from Documentation to samples
> [PATCH v2 2/2] samples: v4l: from Documentation to samples directory

I can take them through the docs tree.

Hans [added], are you OK with moving v4l2-pci-skeleton.c over to
the samples directory?

Thanks,

jon
