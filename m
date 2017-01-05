Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:35934 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937973AbdAETQ4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jan 2017 14:16:56 -0500
Received: by mail-pg0-f66.google.com with SMTP id 75so3298302pgf.3
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Jan 2017 11:16:26 -0800 (PST)
Subject: Re: [PATCH 2/2] kbuild: initramfs cleanup, set target from Kconfig
References: <20170105102936.5673-1-npiggin@gmail.com>
 <20170105102936.5673-2-npiggin@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <09fcfeb5-926b-7a72-c518-c30518471e55@gmail.com>
Date: Thu, 5 Jan 2017 11:07:27 -0800
MIME-Version: 1.0
In-Reply-To: <20170105102936.5673-2-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, torvalds@linux-foundation.org, pebolle@tiscali.nl, ppandit@redhat.com

On 01/05/2017 02:29 AM, Nicholas Piggin wrote:
> Rather than keep a list of all possible compression types in the
> Makefile, set the target explicitly from Kconfig.
> 
> Reviewed-by: Francisco Blas Izquierdo Riera (klondike) <klondike@klondike.es>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
