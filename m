Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:59258 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752615AbZGaM5j (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 31 Jul 2009 08:57:39 -0400
From: David Howells <dhowells@redhat.com>
In-Reply-To: <200907311227.20132.elendil@planet.nl>
References: <200907311227.20132.elendil@planet.nl>
Subject: Re: RomFS: enless loop during make oldconfig from 2.6.24 -> 2.6.31-rc4 (parisc)
Date: Fri, 31 Jul 2009 13:57:34 +0100
Message-ID: <17615.1249045054@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frans Pop <elendil@planet.nl>
Cc: dhowells@redhat.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Woodhouse <David.Woodhouse@intel.com>

Frans Pop <elendil@planet.nl> wrote:

> Near the end of the 'make oldconfig' I got into an endless loop. I never
> even got a chance to make a choice, it just continued looping on the
> display.

It works fine for me, using a GNUmakefile with:

	CROSS_COMPILE	:= hppa-linux-
	ARCH		:= parisc

set.  I used whatever was latest from Linus's tree.  I did just hold enter
down to select all the defaults.

David
