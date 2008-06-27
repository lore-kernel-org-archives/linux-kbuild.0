Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:45086 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755024AbYF0VGC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 Jun 2008 17:06:02 -0400
Subject: Re: [PATCH] Fix a.out.h export to userspace with O= build.
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20080627205712.GA29202@uranus.ravnborg.org>
References: <20080627130236.GD18644@cs181140183.pp.htv.fi>
	 <1214571984.10393.193.camel@pmac.infradead.org>
	 <20080627131231.GF18644@cs181140183.pp.htv.fi>
	 <1214573982.10393.204.camel@pmac.infradead.org>
	 <20080627205712.GA29202@uranus.ravnborg.org>
Content-Type: text/plain
Date: Fri, 27 Jun 2008 22:05:56 +0100
Message-Id: <1214600756.10393.214.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Adrian Bunk <bunk@kernel.org>, torvalds@linux-foundation.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dhowells@redhat.com

On Fri, 2008-06-27 at 22:57 +0200, Sam Ravnborg wrote:
> Hi David.
> 
> Will you carry this patch in your tree or do you
> want me to add it to kbuild-next.git?

I was hoping Linus would apply it, since we could consider it a
regression.

-- 
dwmw2

