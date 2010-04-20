Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.64.118]:33306 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1754561Ab0DTQRo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 20 Apr 2010 12:17:44 -0400
Received: from chimera.site ([71.245.98.113]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Tue, 20 Apr 2010 09:17:39 -0700
Date: Tue, 20 Apr 2010 09:17:37 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: a question about building driver
Message-Id: <20100420091737.bb726ada.rdunlap@xenotime.net>
In-Reply-To: <n2l2986b3941004200213r51f98608n59ab68d3bbf3a814@mail.gmail.com>
References: <n2l2986b3941004200213r51f98608n59ab68d3bbf3a814@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Zhi Li <lizhi1215@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Tue, 20 Apr 2010 17:13:15 +0800 Zhi Li wrote:

> Hi list,
> 
> I'm maintaining a little linux distribution. Sometimes users need to
> build specific drivers for their machine. But they do not want the
> whole linux kernel source which I used to make my linux distribution,
> for they think it eats up too much disk and network bandwith. So, my
> question is whether there's a way to give them partial kernel source
> to build the needed driver module.

We don't support any kind of partial kernel source tree infrastructure per se.

If your distro has a kernel-headers package (or kernel-devel or whatever
you want to call it), you could create source packages of individual drivers
and then use the external (out-of-tree) driver build methodology to build them.
(see Documentation/kbuild/modules.txt)

Building them should be the easy part.  Deciding which ones to package for
the users (or packaging hundreds of them) could be a never-ending job.

Or you could look at using something like the SuSE build service:
  https://build.opensuse.org/

---
~Randy
