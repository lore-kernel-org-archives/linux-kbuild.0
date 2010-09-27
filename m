Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:44349 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756773Ab0I0VZn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 27 Sep 2010 17:25:43 -0400
Message-ID: <4CA10BD5.5090302@suse.cz>
Date: Mon, 27 Sep 2010 23:25:41 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [DIFF] kbuild-generic-v6 -> kbuild/kconfig/kbuild-generic-v7
References: <1284264744-27530-1-git-send-email-lacombar@gmail.com> <1285175274-10232-1-git-send-email-lacombar@gmail.com>
In-Reply-To: <1285175274-10232-1-git-send-email-lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On 22.9.2010 19:07, Arnaud Lacombe wrote:
> Hi,
> 
> Changes since branch `kbuild-generic-v6' are:
>  - rebase against `kbuild/kconfig'
>  - extra parens/column fixes after Michal's comments
>  - delayed window initialization for gconf in order to wait for rootmenu
>    initialization.
>  - commit tagging
> 
> Note that I kept the grammar change and parser regeneration in two separate
> commits, one after the other.
> 
> This branch merge without conflict with 2.6.36-rc5 and the next-20100921 tree.
> Tested with {x,n,menu}config on i386, sh and um.
> 
> The updated series is available in the git repository at:
> 
>  git://github.com/lacombar/linux-2.6.git kbuild/kconfig/kbuild-generic-v7

Pulled, thanks.

Michal
