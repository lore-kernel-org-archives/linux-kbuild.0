Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:38836 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755312AbaCNU6y (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Mar 2014 16:58:54 -0400
Date: Fri, 14 Mar 2014 17:44:50 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kbuild: specify build_docproc as a phony target
Message-ID: <20140314164450.GA18789@sepie.suse.cz>
References: <1390194488-14993-1-git-send-email-yamada.m@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1390194488-14993-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-kbuild@vger.kernel.org

On Mon, Jan 20, 2014 at 02:08:08PM +0900, Masahiro Yamada wrote:
> PHONY target is more suitable for "build_docproc" target.
> 
> Because PHONY targets are always executed, they do not
> have to take FORCE as a prerequisite.
> 
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>

Applied to kbuild.git#kbuild, thanks.

Michal
