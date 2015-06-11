Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:33073 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752301AbbFKMcv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Jun 2015 08:32:51 -0400
Received: by lbcue7 with SMTP id ue7so3341663lbc.0
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Jun 2015 05:32:49 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH] kbuild: include core debug info when DEBUG_INFO_REDUCED
References: <1426902601-13524-1-git-send-email-linux@rasmusvillemoes.dk>
Date: Thu, 11 Jun 2015 14:32:48 +0200
In-Reply-To: <1426902601-13524-1-git-send-email-linux@rasmusvillemoes.dk>
	(Rasmus Villemoes's message of "Sat, 21 Mar 2015 02:50:01 +0100")
Message-ID: <87eglie87j.fsf@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Mar 21 2015, Rasmus Villemoes <linux@rasmusvillemoes.dk> wrote:

> With CONFIG_DEBUG_INFO_REDUCED, we do get quite a lot of debug info
> (around 22.7 MB for a defconfig+DEBUG_INFO_REDUCED). However, the
> "basenames must match" rule used by -femit-struct-debug-baseonly
> option means that we miss some core data structures, such as struct
> {device, file, inode, mm_struct, page} etc.
>
> We can easily get these included as well, while still getting the
> benefits of CONFIG_DEBUG_INFO_REDUCED (faster build times and smaller
> individual object files): All it takes is a dummy translation unit
> including a few strategic headers and compiled with a flag overriding
> -femit-struct-debug-baseonly.
>
> This increases the size of .debug_info by ~0.3%, but these 90 KB
> contain some rather useful info.
>

Any comments on this patch? I know it's a little hacky, but I do find it
rather useful. For example, I just noticed that pahole shows this

struct audit_names {
        struct list_head           list;                 /*     0     0 */

        /* XXX 16 bytes hole, try to pack */

when applied to a vmlinux built with DEBUG_INFO_REDUCED, since debug
info for struct list_head is not included. The same is true for a lot of
other types which are often embedded in structs (e.g. spinlock_t and
atomic_t). I could of course just compile without DEBUG_INFO_REDUCED,
but the time and space savings of that are real and sad to lose (my tree
is 1.8 GB larger when I compile without it).

Rasmus
