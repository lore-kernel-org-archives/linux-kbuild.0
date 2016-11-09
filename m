Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60428 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752932AbcKIVhs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 Nov 2016 16:37:48 -0500
Subject: Re: [PATCH] kbuild: be more careful about matching preprocessed asm
 ___EXPORT_SYMBOL
References: <20161109043405.16344-1-npiggin@gmail.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <964b1393-0838-2f01-f5c6-0932ab3b1248@suse.com>
Date: Wed, 9 Nov 2016 22:37:46 +0100
MIME-Version: 1.0
In-Reply-To: <20161109043405.16344-1-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: =?UTF-8?Q?Philip_M=c3=bcller?= <philm@manjaro.org>, Adam Borowski <kilobyte@angband.pl>, linux-kbuild@vger.kernel.org

Dne 9.11.2016 v 05:34 Nicholas Piggin napsal(a):
> The CRC code for asm exports grabs the preprocessed asm, finds the
> ___EXPORT_SYMBOL and turns those into EXPORT_SYMBOL in a C program
> that can be preprocessed and parsed to create the CRC signatures from
> the type.
> 
> The existing regex matching and replacement is too strict, and doesn't
> deal well with whitespace among other things. The line
> " EXPORT_SYMBOL(sym)" in a .S file would not match due to initial
> whitespace, for example, which resulted in x86's ___preempt_schedule
> failing to get CRCs.
> 
> Reported-by: Philip Müller <philm@manjaro.org>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Applied to kbuild.git#rc-fixes.

Michal

