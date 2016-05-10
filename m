Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:53823 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751054AbcEJPZ0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 May 2016 11:25:26 -0400
Date: Tue, 10 May 2016 17:25:26 +0200
From: Michal Marek <mmarek@suse.com>
Subject: Re: [PATCH] kbuild: fix adjust_autoksyms.sh for modules that need
	only one symbol
Message-ID: <20160510152526.GC13314@pobox.suse.cz>
References: <alpine.LFD.2.20.1604281729590.5091@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.20.1604281729590.5091@knanqh.ubzr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org

On Thu, Apr 28, 2016 at 05:33:38PM -0400, Nicolas Pitre wrote:
> When only one symbol was listed and therefore the line didn't contain
> any space to separate multiple symbols, that symbol got ignored.
> 
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Nicolas Pitre <nico@linaro.org>

Applied to kbuild.git#kbuild.

Michal
