Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nat.scz.novell.com ([213.151.88.252]:52521 "EHLO pobox.suse.cz"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752722Ab0LOMnG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Dec 2010 07:43:06 -0500
Date: Wed, 15 Dec 2010 13:43:05 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kconfig: do not define AUTOCONF_INCLUDED
Message-ID: <20101215124305.GA15407@pobox.suse.cz>
References: <1291530717-26889-1-git-send-email-lacombar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1291530717-26889-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Sun, Dec 05, 2010 at 01:31:57AM -0500, Arnaud Lacombe wrote:
> AUTOCONF_INCLUDED is not checked is not used within the tree and its parent
> header, `autoconf.h', is safe to be re-included.

It could be used by external modules that try to be compatible with
pre-2.6.15 kernels, but the fix is trivial in such case (and I guess
most of them dropped the #include of autoconf.h after it moved from
linux/ to generated/ recently). So I applied this to
kbuild-2.6.git#kconfig, thanks.

Michal
