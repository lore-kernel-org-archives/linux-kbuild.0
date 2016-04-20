Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:47878 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752718AbcDTIaG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Apr 2016 04:30:06 -0400
Date: Wed, 20 Apr 2016 10:30:04 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kbuild: specify modules(_install) as PHONY rather than
	FORCE
Message-ID: <20160420083004.GC15339@pobox.suse.cz>
References: <1457829562-31752-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1457829562-31752-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

On Sun, Mar 13, 2016 at 09:39:22AM +0900, Masahiro Yamada wrote:
> As in other places, PHONY is a better fit for "modules" and
> "modules_install".
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied to kbuild.git#kbuild.

Michal
