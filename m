Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:38095 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752867Ab0GWJZ6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 23 Jul 2010 05:25:58 -0400
Message-ID: <4C49601E.5060605@suse.cz>
Date: Fri, 23 Jul 2010 11:25:50 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] nconfig: Fix segfault when help contains special characters
References: <1279868654-15743-1-git-send-email-bebarino@gmail.com>
In-Reply-To: <1279868654-15743-1-git-send-email-bebarino@gmail.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Boyd <bebarino@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Nir Tzachar <nir.tzachar@gmail.com>

On 23.7.2010 09:04, Stephen Boyd wrote:
> nconfig segfaults when help text contains the character '%'. For a quick
> example, navigate to the kernel compression options and get the help for
> bzip2. Doing so triggers a call to mvwprintw() with a string containing
> '%' and no extra arguments to fill in the specifier's value. Fix this
> case by printing the literal string retrieved from the kconfig.

Thanks, applied.

Michal
