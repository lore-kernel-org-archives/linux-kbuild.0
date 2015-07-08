Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb1-smtp-cloud6.xs4all.net ([194.109.24.24]:47577 "EHLO
	lb1-smtp-cloud6.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758258AbbGHQSH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Jul 2015 12:18:07 -0400
Message-ID: <1436372280.20619.24.camel@tiscali.nl>
Subject: Re: [PATCH, resend] build: fix broken kernel RPM source symlink
From: Paul Bolle <pebolle@tiscali.nl>
Date: Wed, 08 Jul 2015 18:18:00 +0200
In-Reply-To: <00fe01d0b994$af584380$0e08ca80$@numascale.com>
References: <1435664842-17908-1-git-send-email-ec@numascale.com>
		 <1436005169.20057.60.camel@tiscali.nl>
		 <006601d0b823$2b144820$813cd860$@numascale.com>
	 <1436365587.20619.19.camel@tiscali.nl>
	 <00fe01d0b994$af584380$0e08ca80$@numascale.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Espen Carlsen <ec@numascale.com>
Cc: 'Michal Marek' <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 'Daniel J Blueman' <daniel@numascale.com>, 'Steffen Persvold' <sp@numascale.com>

On wo, 2015-07-08 at 17:42 +0200, Espen Carlsen wrote:
> I have tested my suggested changes on:
> CentOS 6.5, 7.0, Ubuntu 14.04 and 12.04. After the patch the kernel
> -devel package will be correct on all systems.
> Without the patch, only CentOS generates correct packages.

Wild guess: do the Ubuntu systems already have 
    /lib/modules/4.1.0/build
    /lib/modules/4.1.0/source

as symlinks to /usr/src/kernels/4.1.0 when you're building the rpms?
(That is, not in rpm's buildroot, but in the actual filesystem.)


Paul Bolle
