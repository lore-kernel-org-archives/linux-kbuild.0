Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:49540 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756916AbYEUKsD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 21 May 2008 06:48:03 -0400
Subject: Re: [PATCH] KBUILD: Move non-__KERNEL__-checking headers to
	header-y.
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20080521100245.GC18352@cs181133002.pp.htv.fi>
References: <alpine.LFD.1.10.0805172016210.8908@localhost.localdomain>
	 <20080520000835.80f7b14a.akpm@linux-foundation.org>
	 <alpine.LFD.1.10.0805210434180.7101@localhost.localdomain>
	 <20080521014337.1543ff20.akpm@linux-foundation.org>
	 <1211360434.21380.319.camel@pmac.infradead.org>
	 <20080521100245.GC18352@cs181133002.pp.htv.fi>
Content-Type: text/plain
Date: Wed, 21 May 2008 11:47:54 +0100
Message-Id: <1211366874.21380.341.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Robert P. J. Day" <rpjday@crashcourse.ca>, kbuild devel list <linux-kbuild@vger.kernel.org>

On Wed, 2008-05-21 at 13:02 +0300, Adrian Bunk wrote:
> > So I see no particular reason why we shouldn't drop header-y completely
> > and just unifdef the lot.
> 
> Sam already ACK'ed this idea when I suggested it a few weeks ago and 
> I'll get my ass up and cook a patch today or tomorrow.

Thanks.

-- 
dwmw2

