Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ist.d-labs.de ([213.239.218.44]:60083 "EHLO mx01.d-labs.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752524Ab0IVJNM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Sep 2010 05:13:12 -0400
Date: Wed, 22 Sep 2010 11:13:08 +0200
From: Florian Mickler <florian@mickler.org>
Subject: Re: make headers_install
Message-ID: <20100922111308.19d7c162@schatten.dmk.lab>
In-Reply-To: <alpine.LNX.2.01.1009192055520.28631@fgnk.ybpnyqbznva>
References: <alpine.LNX.2.01.1009192055520.28631@fgnk.ybpnyqbznva>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mark Hills <mark@pogo.org.uk>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

[cc's added]
On Sun, 19 Sep 2010 21:15:37 +0100 (BST)
Mark Hills <mark@pogo.org.uk> wrote:

> Hi David, I tried to update my kernel headers using the instructions in 
> Documentation/make/headers_install.txt. I followed the example:
> 
>   make headers_install INSTALL_HDR_PATH=/usr/include
> 
> but it installed them in /usr/include/include. So I modified the path:
> 
>   make headers_install INSTALL_HDR_PATH=/usr
> 
> The command installed the headers, but then automatically deleted 
> /usr/include/*.h (nasty!). This is with kernel 2.6.35.4.
> 
> Do the docs need an update (and I should always be installing to a staging 
> area?) Or is this a bug in the process -- where is should be removing 
> unknown files in /usr/include/linux or similar?
> 
> I seem to remember that I used to be able to install headers direct to the 
> system, is this still the case?
> 
> Thanks
> 

