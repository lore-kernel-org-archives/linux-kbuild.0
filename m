Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:53102 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752052AbYBIJwR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 9 Feb 2008 04:52:17 -0500
Date: Sat, 9 Feb 2008 10:52:21 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] Kbuild: Fix deb-pkg target to work with kernel versions ending with -<text-without-digit>
Message-ID: <20080209095221.GA5187@uranus.ravnborg.org>
References: <200802071718.51976.sojkam1@fel.cvut.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200802071718.51976.sojkam1@fel.cvut.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Sojka <sojkam1@fel.cvut.cz>
Cc: linux-kbuild@vger.kernel.org

On Thu, Feb 07, 2008 at 05:18:51PM +0100, Michal Sojka wrote:
> If CONIFIG_LOCALVERSION is set for example to -loop, the following error
> message was generated.
> 
> dpkg-deb - error: Debian revision (`loop') doesn't contain any digits
> dpkg-deb: 1 errors in control file
> 
> The patch solves this by adding a numeric revision to package version.

Applied,
	Sam
