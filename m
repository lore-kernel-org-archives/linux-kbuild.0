Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:44893 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752138AbYAITma (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Jan 2008 14:42:30 -0500
Date: Wed, 9 Jan 2008 20:41:50 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] use C89 random functions in conf.c
Message-ID: <20080109194150.GC6880@uranus.ravnborg.org>
References: <20080109153619.GA11272@michl.2n.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080109153619.GA11272@michl.2n.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ladislav Michl <ladis@linux-mips.org>
Cc: linux-kbuild@vger.kernel.org

On Wed, Jan 09, 2008 at 04:36:19PM +0100, Ladislav Michl wrote:
> Hi,
> 
> rand and srand functions conform also to C89 in addition to POSIX.1-2001,
> which makes them a bit more portable (work also on MinGW host). Linux man
> page also says:
> "The versions of rand() and srand() in the Linux C Library use the same
> random number generator as random() and srandom()".
> Once there, sort includes and remove leading whitespace.

I have applied the relevant bis in two patches.
One as pure cleanup and a second replacing the two remaining random functions
with rand.

	Sam
