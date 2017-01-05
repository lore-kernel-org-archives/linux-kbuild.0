Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:35494 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S969148AbdAETGu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jan 2017 14:06:50 -0500
Received: by mail-pg0-f65.google.com with SMTP id i5so41525234pgh.2
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Jan 2017 11:06:45 -0800 (PST)
Subject: Re: [PATCH 1/2] kbuild: initramfs fix dependency checking for
 compressed target
References: <20170105102936.5673-1-npiggin@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <74b85b35-92aa-50a1-83de-a4dafcbd6d87@gmail.com>
Date: Thu, 5 Jan 2017 11:06:43 -0800
MIME-Version: 1.0
In-Reply-To: <20170105102936.5673-1-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, torvalds@linux-foundation.org, pebolle@tiscali.nl, ppandit@redhat.com

On 01/05/2017 02:29 AM, Nicholas Piggin wrote:
> When using initramfs compression, the data file compression suffix
> gets quotes pulled in from Kconfig, e.g., initramfs_data.cpio".gz"
> which make does not match a target and causes rebuild.
> 
> Fix this by filtering out quotes from the Kconfig string.
> 
> Fixes: 35e669e1a254 ("initramfs: select builtin initram compression algorithm on KConfig instead of Makefile")
> Reviewed-by: Francisco Blas Izquierdo Riera (klondike) <klondike@klondike.es>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
