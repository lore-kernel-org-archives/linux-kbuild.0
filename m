Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46591 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751041Ab0HQHO5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Aug 2010 03:14:57 -0400
Message-ID: <4C6A364A.1070407@suse.cz>
Date: Tue, 17 Aug 2010 09:12:10 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: confdata.c explicitly reference errno, thus need
 <errno.h>
References: <1282023620-15499-1-git-send-email-lacombar@gmail.com>
In-Reply-To: <1282023620-15499-1-git-send-email-lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On 17.8.2010 07:40, Arnaud Lacombe wrote:
> This fixes:
> % gmake LKC_GENPARSER=1 menuconfig
> [...]
> scripts/kconfig/confdata.c:739: error: 'errno' undeclared (first use in this function)
> scripts/kconfig/confdata.c:739: error: (Each undeclared identifier is reported only once
> scripts/kconfig/confdata.c:739: error: for each function it appears in.)
> scripts/kconfig/confdata.c:739: error: 'ENOENT' undeclared (first use in this function)
> 
> triggered on NetBSD.
> 
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> 
> ---
>  scripts/kconfig/confdata.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Applied, thanks.

Michal
