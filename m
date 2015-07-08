Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from numascale.com ([213.162.240.84]:55016 "EHLO numascale.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934414AbbGHPma convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Jul 2015 11:42:30 -0400
From: "Espen Carlsen" <ec@numascale.com>
References: <1435664842-17908-1-git-send-email-ec@numascale.com>	 <1436005169.20057.60.camel@tiscali.nl>	 <006601d0b823$2b144820$813cd860$@numascale.com> <1436365587.20619.19.camel@tiscali.nl>
In-Reply-To: <1436365587.20619.19.camel@tiscali.nl>
Subject: RE: [PATCH, resend] build: fix broken kernel RPM source symlink
Date: Wed, 8 Jul 2015 17:42:23 +0200
Message-ID: <00fe01d0b994$af584380$0e08ca80$@numascale.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-Language: no
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: 'Paul Bolle' <pebolle@tiscali.nl>
Cc: 'Michal Marek' <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 'Daniel J Blueman' <daniel@numascale.com>, 'Steffen Persvold' <sp@numascale.com>

From: Paul Bolle [mailto:pebolle@tiscali.nl]
> On ma, 2015-07-06 at 21:37 +0200, Espen Carlsen wrote:
> And you want this to read
> lrwxrwxrwx    1 root    root                       35 Jul  4 18:31 /lib/modules/4.1.0/build -> /usr/src/kernels/4.1.0
> lrwxrwxrwx    1 root    root                       35 Jul  6 12:15
> /lib/modules/4.1.0/source -> /usr/src/kernels/4.1.0
> drwxr-xr-x    2 root    root                        0 Jul  6 12:15 /usr/src/kernels/4.1.0
> or something equivalent, right?

Correct. And modifying the two ln -sf commands in mkspec makes that happen on a Ubuntu system.
I have tested my suggested changes on:
CentOS 6.5, 7.0, Ubuntu 14.04 and 12.04. After the patch the kernel-devel package will be correct on all systems.
Without the patch, only CentOS generates correct packages.

Espen


