Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46021 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755761Ab3DCOc6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Apr 2013 10:32:58 -0400
Message-ID: <515C3D98.7080203@suse.cz>
Date: Wed, 03 Apr 2013 16:32:56 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: linux-3.9.0-rc1+: Output from "make kernelrelease"contains incorrect
 data
References: <513B8FA7.9040200@googlemail.com> <5159534A.1070500@googlemail.com>
In-Reply-To: <5159534A.1070500@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Chris Clayton <chris2553@googlemail.com>
Cc: linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 1.4.2013 11:28, Chris Clayton wrote:
> Ping!
> 
> This is still happening with 3.9-rc5.
> 
> [chris:~/kernel/linux]$ make bzImage
> ...
> Kernel: arch/x86/boot/bzImage is ready  (#14)
> [chris:~/kernel/linux]$ make kernelrelease
> scripts/kconfig/conf --silentoldconfig Kconfig
> 3.9.0-rc5
> [chris:~/kernel/linux]$ make kernelrelease
> 3.9.0-rc5

You need to run make -s kernelrelease.

Michal
