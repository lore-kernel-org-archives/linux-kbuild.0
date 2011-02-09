Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailfw02.zoner.fi ([84.34.147.249]:27712 "EHLO
	mailfw02.zoner.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750825Ab1BIUSc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Feb 2011 15:18:32 -0500
From: Lasse Collin <lasse.collin@tukaani.org>
Subject: Re: [PATCH] adjust XZ_DEC_* Kconfig defaults
Date: Wed, 9 Feb 2011 22:18:25 +0200
References: <4D5260530200007800030F22@vpn.id2.novell.com> <201102091151.08930.lasse.collin@tukaani.org> <20110209112718.0622417f.rdunlap@xenotime.net>
In-Reply-To: <20110209112718.0622417f.rdunlap@xenotime.net>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201102092218.25081.lasse.collin@tukaani.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Jan Beulich <JBeulich@novell.com>, linux-kbuild@vger.kernel.org

On 2011-02-09 Randy Dunlap wrote:
> Did you see this email?  what do you think of it?
> 
> https://lkml.org/lkml/2011/2/1/438
> Subject: Change DECOMPRESS_LZMA to boolean

No, I didn't see it. Seems that the five DECOMPRESS_* symbols should all 
be booleans. They cannot be built as modules.

-- 
Lasse Collin  |  IRC: Larhzu @ IRCnet & Freenode
