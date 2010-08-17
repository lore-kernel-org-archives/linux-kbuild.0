Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:40741 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754783Ab0HQCrz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Aug 2010 22:47:55 -0400
Date: Tue, 17 Aug 2010 10:51:44 +0800
From: =?utf-8?Q?Am=C3=A9rico?= Wang <xiyou.wangcong@gmail.com>
Subject: Re: [PATCH] modules: don't call depmod when overriding external
 module install path
Message-ID: <20100817025144.GA5095@cr0.nay.redhat.com>
References: <1281945814-9720-1-git-send-email-jcm@jonmasters.org>
 <201008162013.46252.rusty@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201008162013.46252.rusty@rustcorp.com.au>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Jon Masters <jcm@jonmasters.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Mon, Aug 16, 2010 at 08:13:45PM +0930, Rusty Russell wrote:
>On Mon, 16 Aug 2010 05:33:34 pm Jon Masters wrote:
>> Recent kernels include an additional call to depmod during the installation
>> of external kernel modules as a convenience, in order to ensure that those
>> modules are picked up by the module loading tools/initramfs scripts, etc.
>> Although this call is potentially of some value, it should not be made
>> when explicitly setting INSTALL_MOD_PATH to a different location. This
>> avoids creating extraneous modules.* files that will never be used.
>> 
>> Signed-off-by: Jon Masters <jcm@jonmasters.org>
>
>Acked-by: Rusty Russell <rusty@rustcorp.com.au>
>
>I leave the Makefile stuff to the kbuild people...
>

Looks good for me,

Acked-by: WANG Cong <xiyou.wangcong@gmail.com>
