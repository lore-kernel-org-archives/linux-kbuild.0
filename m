Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:38636 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757851AbYBFVNt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Feb 2008 16:13:49 -0500
Date: Wed, 6 Feb 2008 22:13:55 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: defconfigs size reduction?
Message-ID: <20080206211355.GC12043@uranus.ravnborg.org>
References: <142056111@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <142056111@web.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: devzero@web.de
Cc: linux-kbuild@vger.kernel.org

On Sun, Feb 03, 2008 at 01:29:00PM +0100, devzero@web.de wrote:
> hi there, 
> 
> i found that there are a lot of deconfigs bundled with every kernel-release. (about 335 on my suse box)
> 
> summed up, that`s  6,3M and 311 KLOC (Kilo Lines of Configuration :) 
> 
> i think, that`s quite a lot.
> 
> if i strip the comments ( real comments and "# CONFIGOPT is not set") and the blank lines from that, the size reduces to 1.9M and 86 KLOC.
> 

The primary issue with defconfigs are that they get
outdated rather quickly. They are often several kernel releases
behind.
This is a much more relvant issue to address than a few wasted MB of
cheap disk space.
So anything that just make it a tad more difficult to update
a defconfig will not be accepted if the only aim is to save
disk space.

	Sam
