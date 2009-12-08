Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:52760 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753126AbZLHKXv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 Dec 2009 05:23:51 -0500
Message-ID: <4B1E290A.8040005@suse.cz>
Date: Tue, 08 Dec 2009 11:23:06 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] clean out Perl from build system.
References: <200912080317.08254.rob@landley.net>
In-Reply-To: <200912080317.08254.rob@landley.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Landley <rob@landley.net>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On 8.12.2009 10:17, Rob Landley wrote:
> Perl was introduced as a build dependency in 2.6.25.  My cross-compile 
> environment does not use perl, so ever since then I've patched it back out.
> 
> With these patches I've personally built kernels for x86, x86_64, arm, mips, 
> powerpc, sparc, sh4, and m68k.

Hi Rob,

you should CC linux-kbuild@ on patches like this (added now, the whole
series is at http://lkml.org/lkml/2009/12/8/93).

Michal
