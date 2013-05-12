Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([193.170.194.197]:37674 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751492Ab3ELTZr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 May 2013 15:25:47 -0400
Date: Sun, 12 May 2013 21:25:45 +0200
From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH 1/2] scripts/config: replace hard-coded script name by
 a dynamic value
Message-ID: <20130512192544.GZ17814@two.firstfloor.org>
References: <cover.1368379475.git.chauplac@gmail.com>
 <9442eebf0117a0d975ca766ea84efec4ad58c6d0.1368379475.git.chauplac@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9442eebf0117a0d975ca766ea84efec4ad58c6d0.1368379475.git.chauplac@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Clement Chauplannaz <chauplac@gmail.com>
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.cz, andi@firstfloor.org, yann.morin.1998@free.fr

On Sun, May 12, 2013 at 09:08:51PM +0200, Clement Chauplannaz wrote:
> The script `config' prints its name in usage() function. It is currently
> hard-coded to value `config'. However, the script may be reused under
> a different name in contexts other than the Linux Kernel.
> 
> Replace the hard-coded value `config' by the name of the script at runtime.
> 
> Signed-off-by: Clement Chauplannaz <chauplac@gmail.com>

Both patched are fine for me.
Acked-by: Andi Kleen <ak@linux.intel.com>

-Andi
