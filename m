Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:37711 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751057AbaAFMdS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 Jan 2014 07:33:18 -0500
Date: Mon, 6 Jan 2014 13:33:15 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH v2] kbuild: Fix silent builds with make-4
Message-ID: <20140106123315.GA4808@sepie.suse.cz>
References: <1388998720-3037-1-git-send-email-Emilian.Medve@Freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1388998720-3037-1-git-send-email-Emilian.Medve@Freescale.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Emil Medve <Emilian.Medve@Freescale.com>
Cc: linux-kbuild@vger.kernel.org

On Mon, Jan 06, 2014 at 02:58:40AM -0600, Emil Medve wrote:
> make-4 changed the way/order it presents the command line options
> into MAKEFLAGS
> 
> In make-3.8x, '-s' would always be first into a group of options
> with the '-'/hyphen removed
> 
> $ make -p -s 2>/dev/null | grep ^MAKEFLAGS
> MAKEFLAGS = sp
> 
> In make-4, '-s' seems to always be last into a group of options
> with the '-'/hyphen removed
> 
> $ make -s -p 2>/dev/null | grep ^MAKEFLAGS
> MAKEFLAGS = ps
> 
> Signed-off-by: Emil Medve <Emilian.Medve@Freescale.com>
> ---
> 
> v2: Avoid false positives as per Michal's (Marek) feedback

Thanks, applied to kbuild.git#kbuild.

Michal
