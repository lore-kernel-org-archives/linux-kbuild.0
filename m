Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([94.23.35.102]:41606 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751462Ab3CCUBo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 3 Mar 2013 15:01:44 -0500
Date: Sun, 3 Mar 2013 21:01:40 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: randconfig bug when used with KCONFIG_ALLCONFIG
Message-ID: <20130303210140.6f1a93c8@skate>
In-Reply-To: <20130227214102.6d63544d@skate>
References: <20130227214102.6d63544d@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>

Hello,

On Wed, 27 Feb 2013 21:41:02 +0100, Thomas Petazzoni wrote:

> I'd like to report that the randconfig code seems to have a bug when it
> is given a set of fixed values using KCONFIG_ALLCONFIG: it forgets to
> randomize choice values.

Any ideas about this bug?

Thanks a lot for your attention,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
