Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46687 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933456AbbDVOdV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Apr 2015 10:33:21 -0400
Date: Wed, 22 Apr 2015 16:33:20 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH v2] Makefile: Fix detection of clang when cross-compiling
Message-ID: <20150422143320.GB19277@sepie.suse.cz>
References: <1429306504-26122-1-git-send-email-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1429306504-26122-1-git-send-email-paul@crapouillou.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Apr 17, 2015 at 11:35:04PM +0200, Paul Cercueil wrote:
> When the host's C compiler is clang, and when attempting to
> cross-compile Linux e.g. to MIPS with mipsel-linux-gcc, the Makefile
> would incorrectly detect the use of clang, which resulted in
> clang-specific flags being passed to mipsel-linux-gcc.
> 
> This can be verified under Debian by installing the "clang" package,
> and then using it as the default compiler with:
> sudo update-alternatives --config cc
> 
> This patch moves the detection of clang after the $(CC) variable is
> initialized to the name of the cross-compiler, so that the check applies
> to the cross-compiler and not the host's C compiler.
> 
> v2: Move the detection of clang after the inclusion of the
> arch/*/Makefile (as they might set $(CROSS_COMPILE))
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Applied to kbuild.git#kbuild. I will push it after v4.1-rc1 becomes
available, though.

Michal
