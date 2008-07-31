Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtpout3.tre.se ([80.251.192.228]:37720 "EHLO smtpout3.tre.se"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754377AbYGaVgw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 31 Jul 2008 17:36:52 -0400
Date: Thu, 31 Jul 2008 23:37:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [2.6 patch] scripts/ver_linux: don't set PATH
Message-ID: <20080731213730.GA26448@uranus.ravnborg.org>
References: <20080723195045.GB5991@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080723195045.GB5991@cs181140183.pp.htv.fi>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: linux-kbuild@vger.kernel.org

On Wed, Jul 23, 2008 at 10:50:45PM +0300, Adrian Bunk wrote:
> It would have saved both a bug submitter and me a few hours if 
> scripts/ver_linux had picked the same gcc as the build.
> 
> Since I can't see any reason why it fiddles with PATH at all this patch 
> therefore removes the PATH setting.

Applied.

	Sam
