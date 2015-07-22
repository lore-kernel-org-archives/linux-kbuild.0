Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:58078 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934537AbbGVPrr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Jul 2015 11:47:47 -0400
Message-ID: <55AFBB21.7020901@suse.cz>
Date: Wed, 22 Jul 2015 17:47:45 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] Makefile: Force gzip and xz on module install
References: <1436293567-20226-1-git-send-email-Jason@zx2c4.com>
In-Reply-To: <1436293567-20226-1-git-send-email-Jason@zx2c4.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Dne 7.7.2015 v 20:26 Jason A. Donenfeld napsal(a):
> Running `make modules_install` ordinarily will overwrite existing
> modules. This is the desired behavior, and is how pretty much every
> other `make install` target works.
> 
> However, if CONFIG_MODULE_COMPRESS is enabled, modules are passed
> through gzip and xz which then do the file writing. Both gzip and xz
> will error out if the file already exists, unless -f is passed.
> 
> This patch adds -f so that the behavior is uniform.
> 
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Applied to kbuild.git#rc-fixes.

Michal

