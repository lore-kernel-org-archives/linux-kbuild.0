Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:63694 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753626AbYFXOb0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Jun 2008 10:31:26 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/5] kbuild: prepare headers_* for arch/$ARCH/include
Date: Tue, 24 Jun 2008 16:31:18 +0200
References: <20080622220508.GA8957@uranus.ravnborg.org> <1214172524-9043-1-git-send-email-sam@ravnborg.org>
In-Reply-To: <1214172524-9043-1-git-send-email-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200806241631.18929.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Monday 23 June 2008, Sam Ravnborg wrote:
> +# Do not try this architecture
> +drop="generic um ppc sparc64 cris"
> +
> +archs=$(ls ${srctree}/arch)
> +
> +for arch in ${archs}; do
> +	case ${arch} in
> +	um)        # no userspace export
> +		;;
> +	ppc)       # headers exported by powerpc
> +		;;

Note that arch/ppc is scheduled for removal with the 2.6.27 merge
window, so you may want to leave it out right away.

	Arnd <><
