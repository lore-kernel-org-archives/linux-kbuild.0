Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:27251 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752861AbZBXTSn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Feb 2009 14:18:43 -0500
Message-ID: <49A44850.5010905@oracle.com>
Date: Tue, 24 Feb 2009 11:19:44 -0800
From: Randy Dunlap <randy.dunlap@oracle.com>
MIME-Version: 1.0
Subject: Re: potential linking bug in recursive directory descent
References: <b493f8670902241105l48bd7cdbmb99608e802d2454a@mail.gmail.com>
In-Reply-To: <b493f8670902241105l48bd7cdbmb99608e802d2454a@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fred Isaman <iisaman@citi.umich.edu>
Cc: linux-kbuild@vger.kernel.org

Fred Isaman wrote:
> The pnfs tree base of of 2.6.29-rc5 uses the new find_last_bit

Where is the pnfs tree?

> function (defined in
> lib/find_last_bit.c) in a file in the fs/nfs directory.  Myself and
> another developer (though no one else so far) get the following error
> during compile:
> 
>    Kernel: arch/x86/boot/bzImage is ready  (#5)
>      Building modules, stage 2.
>      MODPOST 515 modules
>    ERROR: "find_last_bit" [fs/nfs/nfs.ko] undefined!
>    make[2]: *** [__modpost] Error 1
>    make[1]: *** [modules] Error 2
>    make: *** [sub-make] Error 2
> 
> 
> Note that find_last_bit() is not used in any file in the fs directory.
> If I add it to any function that is EXPORT_SYMBOL'ed
> from the fs directory, suddenly the compile errors go away.  (See the
> below patch for a more concrete example.)
> 
> I am not sure what is going on, and why it only affects some
> developers, but it looks a lot like the kbuild system
> is deciding that the library does not need to be included at the fs
> directory level, so isn't including it in fs/nfs where
> it is needed.
> 
> Thanks for any help.
> Fred

A failing .config file would be helpful.

Is CONFIG_GENERIC_FIND_LAST_BIT set in your .config file?

If you change lib/Makefile like this:
-lib-$(CONFIG_GENERIC_FIND_LAST_BIT) += find_last_bit.o
+obj-$(CONFIG_GENERIC_FIND_LAST_BIT) += find_last_bit.o

i.e., s/lib/obj/, does your build succeed?


> From 4bd89543983640ab01c9b704d427f83dad3aa455 Mon Sep 17 00:00:00 2001
> From: Fred Isaman <iisaman@citi.umich.edu>
> Date: Fri, 20 Feb 2009 11:58:52 -0500
> Subject: [PATCH 1/1] DEBUG: Need this to compile - what the heck?
> 
> This looks suspiciously like a bug in the kbuild system, where
> the library include is not passed down to fs/nfs unless it is
> used by fs.  Without this, I get the following error during linking:
> 
> Kernel: arch/x86/boot/bzImage is ready  (#5)
>  Building modules, stage 2.
>  MODPOST 515 modules
> ERROR: "find_last_bit" [fs/nfs/nfs.ko] undefined!
> make[2]: *** [__modpost] Error 1
> make[1]: *** [modules] Error 2
> make: *** [sub-make] Error 2
> 
> Signed-off-by: Fred Isaman <iisaman@citi.umich.edu>
> ---
>  fs/inode.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/fs/inode.c b/fs/inode.c
> index 306faef..a4e29b3 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -226,6 +226,7 @@ EXPORT_SYMBOL(destroy_inode);
>  */
>  void inode_init_once(struct inode *inode)
>  {
> +       find_last_bit((unsigned long *) inode, 5);
>        memset(inode, 0, sizeof(*inode));
>        INIT_HLIST_NODE(&inode->i_hash);
>        INIT_LIST_HEAD(&inode->i_dentry);
> --

-- 
~Randy
