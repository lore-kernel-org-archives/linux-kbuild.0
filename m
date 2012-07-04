Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46621 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752128Ab2GDQdw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Jul 2012 12:33:52 -0400
Date: Wed, 4 Jul 2012 18:33:51 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] xconfig: use pkgconfig to find moc
Message-ID: <20120704163351.GB12094@sepie.suse.cz>
References: <1339455368-7620-1-git-send-email-yselkowitz@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1339455368-7620-1-git-send-email-yselkowitz@users.sourceforge.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yaakov (Cygwin/X)" <yselkowitz@users.sourceforge.net>
Cc: linux-kbuild@vger.kernel.org

On Mon, Jun 11, 2012 at 05:56:08PM -0500, Yaakov (Cygwin/X) wrote:
> -	  binpath="\$$(shell pkg-config QtCore --variable=prefix)"; \
> -	  moc="$$binpath/bin/moc"; \
> +	  moc="\$$(shell pkg-config QtCore --variable=moc_location)"; \
>  	fi; \

Could you keep the $$binpath/bin/moc as a fallback, so that make xconfig
works even with old Qt4 releases. We support even Qt3, so let's continue
to be nice to users.

Michal
