Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:46494 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750990AbbJZVVQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 26 Oct 2015 17:21:16 -0400
Subject: Re: [PATCH] scripts/package/Makefile: Restore the RPMOPTS variable
References: <1445040549-31011-1-git-send-email-jim.epost@gmail.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <562E994A.2000104@suse.com>
Date: Mon, 26 Oct 2015 22:21:14 +0100
MIME-Version: 1.0
In-Reply-To: <1445040549-31011-1-git-send-email-jim.epost@gmail.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, alaa.hl2@gmail.com

Dne 17.10.2015 v 02:09 Jim Davis napsal(a):
> Restore the RPMOPTS variable to the rpm-pkg and binrpm-pkg targets
> that commit 21a59991ce0c ("scripts/package/Makefile: rpmbuild is
> needed for rpm targets") removed.
> 
> Reported-by: Alaa Hleihel <alaa.hl2@gmail.com>
> Signed-off-by: Jim Davis <jim.epost@gmail.com>

If this is a regression fix, please add a Fixes: hash ("commit message")
line to the signoff area.

Out of curiosity, what options do you need to pass to rpmbuild?

Michal
