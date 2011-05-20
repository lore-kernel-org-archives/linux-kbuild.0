Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:59784 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933375Ab1ETGsa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 20 May 2011 02:48:30 -0400
Date: Fri, 20 May 2011 09:48:27 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [PATCH] kstrtox: drop kstrtol()/kstrtoul() when possible
Message-ID: <20110520064827.GA14185@p183>
References: <20110520061259.GA13483@p183>
 <BANLkTi=2yReXfrr7swhys7TgkuJ5r97jqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BANLkTi=2yReXfrr7swhys7TgkuJ5r97jqQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, arnd@arndb.de, mmarek@suse.cz, linux-kbuild@vger.kernel.org

On Fri, May 20, 2011 at 08:20:42AM +0200, Geert Uytterhoeven wrote:
> On Fri, May 20, 2011 at 08:15, Alexey Dobriyan <adobriyan@gmail.com> wrote:
> > If "long" and "long long" types are identical at runtime,
> > kstrtol() can be aliased to kstrtoll().
> >
> > Unfortunately, one can't write
> >
> >        #if sizeof(long) == sizeof(long long) ...
> 
> One can write #ifdef CONFIG_64BIT instead.

And alignment will match, on any arch, now and in future?
I don't think so.
