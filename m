Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Cpsmtpm-eml108.kpnxchange.com ([195.121.3.12]:51928 "EHLO
	CPSMTPM-EML108.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751863AbZGaPaJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 31 Jul 2009 11:30:09 -0400
From: Frans Pop <elendil@planet.nl>
Subject: Re: RomFS: enless loop during make oldconfig from 2.6.24 -> 2.6.31-rc4 (parisc)
Date: Fri, 31 Jul 2009 17:30:07 +0200
References: <200907311227.20132.elendil@planet.nl> <17615.1249045054@redhat.com>
In-Reply-To: <17615.1249045054@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200907311730.08804.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Woodhouse <David.Woodhouse@intel.com>

Thanks for the quick response David.

On Friday 31 July 2009, David Howells wrote:
> Frans Pop <elendil@planet.nl> wrote:
> > Near the end of the 'make oldconfig' I got into an endless loop. I
> > never even got a chance to make a choice, it just continued looping
> > on the display.
>
> It works fine for me, using a GNUmakefile with:
>
> 	CROSS_COMPILE	:= hppa-linux-
> 	ARCH		:= parisc
>
> set.  I used whatever was latest from Linus's tree.  I did just hold
> enter down to select all the defaults.

I've tried again too. With all defaults I cannot reproduce it either.
But if I answer the questions below as follows, I do get the loop again:

Advanced netfilter configuration: N
Wireless: N
* sound drivers: N (* = "PCI","USB" and one or two others)
Default ext3 to "data=ordered": Y

Cheers,
FJP
