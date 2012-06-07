Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([213.235.205.2]:55468 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751079Ab2FGCyX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Jun 2012 22:54:23 -0400
Date: Thu, 7 Jun 2012 04:54:17 +0200
From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH 1/3] scripts/config: be case-sensitive on config option symbols
Message-ID: <20120607025417.GJ27374@one.firstfloor.org>
References: <1339021751-26474-1-git-send-email-yann.morin.1998@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1339021751-26474-1-git-send-email-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, Andi Kleen <andi@firstfloor.org>, Michal Marek <mmarek@suse.cz>

> With this patch, if the KCONFIG_CASE environment variable is set to (with
> no quotes):
>   - 'upper': force symbols to upper-case
>   - 'lower': force symbols to lower-case

That's ugly. How about a emacs style heuristic. When the config symbol
is mixed case do not change the symbol?

-Andi
