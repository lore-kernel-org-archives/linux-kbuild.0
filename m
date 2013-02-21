Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:33439 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755040Ab3BUXOS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 21 Feb 2013 18:14:18 -0500
Message-ID: <5126AA4B.2080600@suse.cz>
Date: Fri, 22 Feb 2013 00:14:19 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Size of images in make-kpkg and make deb-pkg
References: <CALZVapk=-8t8BihTSoTJ=Fh3C9xBtDc9ETpmGpjNBrTYiJLF7g@mail.gmail.com>
In-Reply-To: <CALZVapk=-8t8BihTSoTJ=Fh3C9xBtDc9ETpmGpjNBrTYiJLF7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Javier Domingo <javierdo1@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On 12.2.2013 01:29, Javier Domingo wrote:
> Hello,
> 
> I don't know if this belongs here, but I just wanted to came across a
> strange thing I am experiencing. I am currently working on v3.6, and I
> have just discovered that generated kernel images have a totally
> unrelated size.
> 
> When I compile with something like make-kpkg --initrd kernel_image
> kernel_headers, the generated image is 7.7MB, and when I then run make
> deb-pkg, the generated deb package is 33MB.
> 
> Other sizes are:
> 6.5M <-> 24M
> 38M <-> 484M (!!!)

My guess is that the big one includes full debuginfo, while the other
one is stripped.

Michal

