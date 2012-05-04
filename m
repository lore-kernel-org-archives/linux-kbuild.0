Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:59144 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760329Ab2EDW1R (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 May 2012 18:27:17 -0400
Date: Sat, 5 May 2012 00:09:07 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kbuild: Makefile: remove unnecessary check for m68knommu
 ARCH
Message-ID: <20120504220907.GA13701@sepie.suse.cz>
References: <1335496484-3438-1-git-send-email-laface.tw@gmail.com>
 <CAMuHMdVYFvszp=5_ZG4ztpviTV_wj_+zSd=C3UAXk_YwR6GZ5A@mail.gmail.com>
 <4F9D2458.5040401@snapgear.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F9D2458.5040401@snapgear.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Ungerer <gerg@snapgear.com>
Cc: Edward Shao <laface.tw@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kbuild@vger.kernel.org, sam@ravnborg.org, Greg Ungerer <gerg@uclinux.org>

On Sun, Apr 29, 2012 at 09:22:00PM +1000, Greg Ungerer wrote:
> On 04/27/2012 03:12 PM, Geert Uytterhoeven wrote:
> >On Fri, Apr 27, 2012 at 05:14, Edward Shao<laface.tw@gmail.com>  wrote:
> >>ARCH is never set to m68knomm.
> >>make ARCH=m68knomm is not supported anymore.
> >>
> >>Signed-off-by: Edward Shao<laface.tw@gmail.com>
> >
> >Acked-by: Geert Uytterhoeven<geert@linux-m68k.org>
> 
> Acked-by: Greg Ungerer <gerg@uclinux.org>

Applied to kbuild.git#kbuild, thanks.

Michal
