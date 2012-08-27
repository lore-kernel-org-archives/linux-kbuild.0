Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from alice.et.bocholt.fh-gelsenkirchen.de ([193.175.197.63]:60055
	"EHLO alice.et.bocholt.fh-gelsenkirchen.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751295Ab2H0Mh7 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 27 Aug 2012 08:37:59 -0400
From: Dirk Gouders <gouders@et.bocholt.fh-gelsenkirchen.de>
Subject: Re: [PATCH v2 4/6] menuconfig: Add jump keys to search results
In-Reply-To: <1345748108-12206-5-git-send-email-bpoirier@suse.de> (Benjamin
	Poirier's message of "Thu, 23 Aug 2012 14:55:06 -0400")
References: <1345748108-12206-1-git-send-email-bpoirier@suse.de>
	<1345748108-12206-5-git-send-email-bpoirier@suse.de>
Date: Mon, 27 Aug 2012 14:37:11 +0200
Message-ID: <gi7gska4ug.fsf@mx10.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Benjamin Poirier <bpoirier@suse.de>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@xenotime.net>, Borislav Petkov <bp@alien8.de>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Jean Sacren <sakiwit@gmail.com>, Arnaud Lacombe <lacombar@gmail.com>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, Davidlohr Bueso <dave@gnu.org>, Wang YanQing <udknight@gmail.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Cheng Renquan <crquan@gmail.com>

Benjamin Poirier <bpoirier@suse.de> writes:

> makes it possible to jump directly to the menu for a configuration entry after
> having searched for it with '/'. If this menu is not currently accessible we
> jump to the nearest accessible parent instead. After exiting this menu, the
> user is returned to the search results where he may jump further in or
> elsewhere.

I applied your patches, played with menuconfig and did not notice any
problems.  What I especially like is that if I am guided to a nearest
accessible parent in cases where a menu is not currently accessible and
do modifications there, these modifications are visible in the search
results when I return to them.

Dirk
