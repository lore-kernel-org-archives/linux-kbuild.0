Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpm-eml105.kpnxchange.com ([195.121.3.9]:49527 "EHLO
	CPSMTPM-EML105.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751953AbZGaM26 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 31 Jul 2009 08:28:58 -0400
From: Frans Pop <elendil@planet.nl>
Subject: Re: RomFS: enless loop during make oldconfig from 2.6.24 -> 2.6.31-rc4 (parisc)
Date: Fri, 31 Jul 2009 14:28:55 +0200
References: <200907311227.20132.elendil@planet.nl> <4977.1249041840@redhat.com>
In-Reply-To: <4977.1249041840@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200907311428.56932.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Woodhouse <David.Woodhouse@intel.com>

On Friday 31 July 2009, David Howells wrote:
> Frans Pop <elendil@planet.nl> wrote:
> > # Linux kernel version: 2.6.24-rc3test
>
> I presume this is not the version of the kernel you're using.  This
> RomFS feature was not upstream back then.  What version are you using?

As the Subject says, the make oldconfig was for 2.6.31-rc4 :-)

$ git describe master
v2.6.31-rc4-294-gf5886c7

Cheers,
FJP
