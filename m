Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from static-71-162-243-5.phlapa.fios.verizon.net ([71.162.243.5]:35399
	"EHLO grelber.thyrsus.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753643AbZLHPQg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 Dec 2009 10:16:36 -0500
From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH 0/3] clean out Perl from build system.
Date: Tue, 8 Dec 2009 09:08:06 -0600
References: <200912080317.08254.rob@landley.net> <4B1E290A.8040005@suse.cz>
In-Reply-To: <4B1E290A.8040005@suse.cz>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200912080908.06875.rob@landley.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Tuesday 08 December 2009 04:23:06 Michal Marek wrote:
> On 8.12.2009 10:17, Rob Landley wrote:
> > Perl was introduced as a build dependency in 2.6.25.  My cross-compile
> > environment does not use perl, so ever since then I've patched it back
> > out.
> >
> > With these patches I've personally built kernels for x86, x86_64, arm,
> > mips, powerpc, sparc, sh4, and m68k.
>
> Hi Rob,
>
> you should CC linux-kbuild@ on patches like this (added now, the whole
> series is at http://lkml.org/lkml/2009/12/8/93).
>
> Michal

Thanks.  LWN said Sam Ravnborg was stepping down, and I haven't kept up with 
who's in charge now.

Rob
-- 
Latency is more important than throughput. It's that simple. - Linus Torvalds
