Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([213.235.205.2]:55902 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932762Ab2FGSR4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Jun 2012 14:17:56 -0400
Date: Thu, 7 Jun 2012 20:17:50 +0200
From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH 1/3] scripts/config: be case-sensitive on config option symbols
Message-ID: <20120607181750.GO27374@one.firstfloor.org>
References: <1339021751-26474-1-git-send-email-yann.morin.1998@free.fr> <20120607025417.GJ27374@one.firstfloor.org> <201206072006.24915.yann.morin.1998@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201206072006.24915.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, Andi Kleen <andi@firstfloor.org>, Michal Marek <mmarek@suse.cz>

> What about adding an option to keep the case as-is:
>     --keep-case|-k      Keep symbol's case (dont' upper-case it)

That's fine.

-Andi
