Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from numascale.com ([213.162.240.84]:42220 "EHLO numascale.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753656AbbGHSrS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Jul 2015 14:47:18 -0400
From: "Espen Carlsen" <ec@numascale.com>
References: <1435664842-17908-1-git-send-email-ec@numascale.com>		 <1436005169.20057.60.camel@tiscali.nl>		 <006601d0b823$2b144820$813cd860$@numascale.com>	 <1436365587.20619.19.camel@tiscali.nl>	 <00fe01d0b994$af584380$0e08ca80$@numascale.com> <1436372280.20619.24.camel@tiscali.nl>
In-Reply-To: <1436372280.20619.24.camel@tiscali.nl>
Subject: RE: [PATCH, resend] build: fix broken kernel RPM source symlink
Date: Wed, 8 Jul 2015 20:47:12 +0200
Message-ID: <010a01d0b9ae$809dd5e0$81d981a0$@numascale.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-Language: no
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: 'Paul Bolle' <pebolle@tiscali.nl>
Cc: 'Michal Marek' <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 'Daniel J Blueman' <daniel@numascale.com>, 'Steffen Persvold' <sp@numascale.com>

> From: Paul Bolle [mailto:pebolle@tiscali.nl]
> On wo, 2015-07-08 at 17:42 +0200, Espen Carlsen wrote:
> Wild guess: do the Ubuntu systems already have
>     /lib/modules/4.1.0/build
>     /lib/modules/4.1.0/source
> as symlinks to /usr/src/kernels/4.1.0 when you're building the rpms?
> (That is, not in rpm's buildroot, but in the actual filesystem.)

No, I don't have any 4.x kernels installed on that system, just 3.16 Ubuntu kernel.
I assume your wild guess was that if I had /lib/modules/4.1.0/build & source as that was the kernel I was building?

Also, so you know, the issue isn't related to the 4.1.0 kernel, I can reproduce this on 4.0.x, 3.19.x and 3.18.x.
Probably others also, but those are the ones I've tried.
On all of them when I compile on Ubuntu, there will be a build and source softlink in the lib/modules/version/ directory
of BUILDROOT.

Espen

