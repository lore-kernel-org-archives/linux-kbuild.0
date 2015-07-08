Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb1-smtp-cloud2.xs4all.net ([194.109.24.21]:50229 "EHLO
	lb1-smtp-cloud2.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758298AbbGHO0c (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Jul 2015 10:26:32 -0400
Message-ID: <1436365587.20619.19.camel@tiscali.nl>
Subject: Re: [PATCH, resend] build: fix broken kernel RPM source symlink
From: Paul Bolle <pebolle@tiscali.nl>
Date: Wed, 08 Jul 2015 16:26:27 +0200
In-Reply-To: <006601d0b823$2b144820$813cd860$@numascale.com>
References: <1435664842-17908-1-git-send-email-ec@numascale.com>
	 <1436005169.20057.60.camel@tiscali.nl>
	 <006601d0b823$2b144820$813cd860$@numascale.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Espen Carlsen <ec@numascale.com>
Cc: 'Michal Marek' <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 'Daniel J Blueman' <daniel@numascale.com>, 'Steffen Persvold' <sp@numascale.com>

On ma, 2015-07-06 at 21:37 +0200, Espen Carlsen wrote:
> To sum it all up, without the change to mkspec, the package 'kernel
> -devel' package generated on an Ubuntu system is broken, as 
> '/lib/modules/4.1.0/build' points to a directory that will not be on 
> the server where the package is installed on:
> user@build-ubuntu:/srv/user/rpmbuild/RPMS/x86_64$ rpm -qplv kernel-devel-4.1.0-1.x86_64.rpm
> lrwxrwxrwx    1 root    root                       35 Jul  4 18:31 /lib/modules/4.1.0/build -> /srv/user/rpmbuild/BUILD/kernel-4.1.0
> lrwxrwxrwx    1 root    root                       35 Jul  6 12:15 /lib/modules/4.1.0/source -> /srv/user/rpmbuild/BUILD/kernel-4.1.0
> drwxr-xr-x    2 root    root                        0 Jul  6 12:15 /usr/src/kernels/4.1.0

And you want this to read
lrwxrwxrwx    1 root    root                       35 Jul  4 18:31 /lib/modules/4.1.0/build -> /usr/src/kernels/4.1.0
lrwxrwxrwx    1 root    root                       35 Jul  6 12:15 /lib/modules/4.1.0/source -> /usr/src/kernels/4.1.0
drwxr-xr-x    2 root    root                        0 Jul  6 12:15 /usr/src/kernels/4.1.0

or something equivalent, right?


Paul Bolle
