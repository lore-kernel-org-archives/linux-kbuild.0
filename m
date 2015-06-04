Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46891 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932152AbbFDOnL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 4 Jun 2015 10:43:11 -0400
Date: Thu, 4 Jun 2015 16:43:09 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH 2/3] kconfig: Wrap long "make help" text lines
Message-ID: <20150604144309.GA2658@sepie.suse.cz>
References: <1432640395-17310-1-git-send-email-geert+renesas@glider.be>
 <1432640395-17310-2-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1432640395-17310-2-git-send-email-geert+renesas@glider.be>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 26, 2015 at 01:39:54PM +0200, Geert Uytterhoeven wrote:
> Some "make help" text lines extend beyond 80 characters. Wrap them at 79
> characters.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to kbuild.git#kconfig.

Michal
