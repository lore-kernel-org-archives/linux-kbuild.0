Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:52358 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754621Ab1HaOnN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 31 Aug 2011 10:43:13 -0400
Date: Wed, 31 Aug 2011 16:43:12 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH 10/11] scripts/Makefile.build: do not reference
 EXTRA_CFLAGS as CFLAGS replacement
Message-ID: <20110831144312.GC30387@sepie.suse.cz>
References: <1313384834-24433-1-git-send-email-lacombar@gmail.com>
 <1313384834-24433-11-git-send-email-lacombar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1313384834-24433-11-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org

On Mon, Aug 15, 2011 at 01:07:13AM -0400, Arnaud Lacombe wrote:
> Usage of these flags has been deprecated for nearly 4 years by:
> 
>     commit f77bf01425b11947eeb3b5b54685212c302741b8
>     Author: Sam Ravnborg <sam@neptun.(none)>
>     Date:   Mon Oct 15 22:25:06 2007 +0200
> 
>         kbuild: introduce ccflags-y, asflags-y and ldflags-y
> 
> Moreover, these flags (at least EXTRA_CFLAGS) have been documented for command
> line use. By default, gmake(1) do not override command line setting, so this is
> likely to result in build failure or unexpected behavior.
> 
> Do not advertise for its usage.
> 
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: linux-kbuild@vger.kernel.org

Thanks, I applied this to kbuild-2.6.git#kbuild with your signoff
assumed.

Michal
