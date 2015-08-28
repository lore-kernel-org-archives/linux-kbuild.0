Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailrelay.lanline.com ([216.187.10.16]:14332 "EHLO
	mailrelay.lanline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752124AbbH1NKJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 28 Aug 2015 09:10:09 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <21984.23085.125231.147499@quad.stoffel.home>
Date: Fri, 28 Aug 2015 08:55:09 -0400
From: "John Stoffel" <john@stoffel.org>
Subject: Re: [RFC/PATCH 0/2] A simpler way to maintain custom defconfigs
In-Reply-To: <1440680925-2879-1-git-send-email-felipe.contreras@gmail.com>
References: <1440680925-2879-1-git-send-email-felipe.contreras@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Felipe Contreras <felipe.contreras@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>, Linus Torvalds <torvalds@linux-foundation.org>


Felipe> For several years I've used a trick to be able to maintain a simple defconfig
Felipe> that works across many versions, and requires little maintenance from my
Felipe> part:

Felipe> % cat arch/x86/configs/x86_64_defconfig ~/my-config > .config && make olddefconfig

Felipe> I'm sending a proposal to integrate it on the build system so that many people
Felipe> can do the same in a simple manner.

Felipe> The interesting part is how to generate this simplified defconfig. In a
Felipe> nutshell; you want to take your .config, remove everything that is the default
Felipe> in the Kconfig files (what savedefconfig does), but also removes anything that
Felipe> is in the default defconfig (e.g. x86_64_defconfig)

Felipe> I've been doing this by hand, but today I gave it a shot to automate this. The
Felipe> result is a bit crude, but it works.

Felipe> Thoughts?

I like this idea, it makes alot of sense to me, and looks like it will
simplify things for people.  

