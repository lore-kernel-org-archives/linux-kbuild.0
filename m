Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:35565 "EHLO
	asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752380AbaHSEfX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Aug 2014 00:35:23 -0400
Date: Tue, 19 Aug 2014 06:35:18 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: fix bug with modpost Makefile warn flag inclusion
Message-ID: <20140819043517.GA21121@ravnborg.org>
References: <53F26025.4010902@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53F26025.4010902@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ton <linuxham@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Mon, Aug 18, 2014 at 02:20:53PM -0600, Michael Ton wrote:
> From: Michael Ton <linuxham@gmail.com>
> 
> The current Makefile.modpost file includes a warn (-w) flag to modpost if
> KBUILD_EXTMOD or KBUILD_MODPOST_WARN.  This flag should only be added if
> both flags are true.  Whenever KBUILD_MODPOST is true, modpost currently
> only prints warnings and does not exit on error (such as on an undefined
> symbol).

From the documentation:
KBUILD_MODPOST_WARN
--------------------------------------------------
KBUILD_MODPOST_WARN can be set to avoid errors in case of undefined
symbols in the final module linking stage. It changes such errors
into warnings.

Nothing here say that we need KBUILD_EXTMOD to use this.

Why did you conclude that KBUILD_MODPOST_WARN is only relevant for
KBUILD_EXTMOD? Something must have triggerede the patch...


	Sam
