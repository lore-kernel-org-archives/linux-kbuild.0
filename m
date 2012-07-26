Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:33049 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751341Ab2GZKUh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 26 Jul 2012 06:20:37 -0400
Date: Thu, 26 Jul 2012 12:20:35 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] scripts/config: fix double-quotes un-escaping
Message-ID: <20120726102035.GA25512@sepie.suse.cz>
References: <1342384655-7769-1-git-send-email-yann.morin.1998@free.fr>
 <201207242313.04493.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201207242313.04493.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org

On Tue, Jul 24, 2012 at 11:13:04PM +0200, Yann E. MORIN wrote:
> Michal, All,
> 
> On Sunday 15 July 2012 22:37:35 Yann E. MORIN wrote:
> > When reporting a string value, only the first double-quote was un-escaped.
> > We need to un-escape all escaped double-quotes.
> 
> Ping? ;-)
> Do you plan to add this one to your tree before you ask Linus to pull?

Yes, I just did so.

Thanks,
Michal
