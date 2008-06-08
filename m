Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:39547 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754481AbYFHUGp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 8 Jun 2008 16:06:45 -0400
Date: Sun, 8 Jun 2008 22:07:27 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] Speed up "make headers_*"
Message-ID: <20080608200727.GA32141@uranus.ravnborg.org>
References: <20080608094730.GA30098@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080608094730.GA30098@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>

On Sun, Jun 08, 2008 at 11:47:30AM +0200, Sam Ravnborg wrote:
> This is just a heads up patch if anyone is interested.
> I finally took the time needed to optimize the
> make headers_* targets.

Based on inputs from various people I have now updated the patch.
A proper serie with a few preparational patches will be posted
and they are aiming for kbuild-next.

The patchset:

      kbuild: refactor headers_* targets in Makefile
      kbuild: always unifdef files in headers_install*
      kbuild: drop support of ALTARCH for headers_*
      kbuild: code refactoring in Makefile.headerinst
      kbuild: error out early in make headers_install
      kbuild: optimize headers_* targets

The meat of the patch is in the last patch which contains all
the real improvements.

	Sam
