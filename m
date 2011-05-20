Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:53004 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933208Ab1ETGyT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 20 May 2011 02:54:19 -0400
Date: Thu, 19 May 2011 23:54:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] kstrtox: drop kstrtol()/kstrtoul() when possible
Message-Id: <20110519235449.ac0ac1c4.akpm@linux-foundation.org>
In-Reply-To: <20110520064827.GA14185@p183>
References: <20110520061259.GA13483@p183>
	<BANLkTi=2yReXfrr7swhys7TgkuJ5r97jqQ@mail.gmail.com>
	<20110520064827.GA14185@p183>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, arnd@arndb.de, mmarek@suse.cz, linux-kbuild@vger.kernel.org

On Fri, 20 May 2011 09:48:27 +0300 Alexey Dobriyan <adobriyan@gmail.com> wrote:

> On Fri, May 20, 2011 at 08:20:42AM +0200, Geert Uytterhoeven wrote:
> > On Fri, May 20, 2011 at 08:15, Alexey Dobriyan <adobriyan@gmail.com> wrote:
> > > If "long" and "long long" types are identical at runtime,
> > > kstrtol() can be aliased to kstrtoll().
> > >
> > > Unfortunately, one can't write
> > >
> > > __ __ __ __#if sizeof(long) == sizeof(long long) ...
> > 
> > One can write #ifdef CONFIG_64BIT instead.
> 
> And alignment will match, on any arch, now and in future?
> I don't think so.

Don't worry about it.

z:/usr/src/linux-2.6.39> grep -r "#[    ]*if.*CONFIG_64BIT" . | wc -l
547

So much other stuff will break that kstrtofoo is a drop in the bucket.
