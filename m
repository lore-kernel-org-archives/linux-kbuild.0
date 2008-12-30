Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ns2.suse.de ([195.135.220.15]:54047 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751692AbYL3KnZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 30 Dec 2008 05:43:25 -0500
From: Andreas Schwab <schwab@suse.de>
Subject: Re: Many warnings from our userspace headers
References: <20081230103348.GA363@uranus.ravnborg.org>
Date: Tue, 30 Dec 2008 11:43:22 +0100
In-Reply-To: <20081230103348.GA363@uranus.ravnborg.org> (Sam Ravnborg's
	message of "Tue, 30 Dec 2008 11:33:48 +0100")
Message-ID: <jeiqp2j645.fsf@sykes.suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, janitors <kernel-janitors@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>

Sam Ravnborg <sam@ravnborg.org> writes:

> /home/sam/kernel/knext.git/usr/include/linux/acct.h:62: leaks CONFIG_M68K to userspace where it is not valid

IMHO this is a false positive, since it is protected by __KERNEL__ in
the same expression.

Andreas.

-- 
Andreas Schwab, SuSE Labs, schwab@suse.de
SuSE Linux Products GmbH, Maxfeldstraße 5, 90409 Nürnberg, Germany
PGP key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
