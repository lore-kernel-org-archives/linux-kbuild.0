Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:36316 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752035AbbHTMiM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Aug 2015 08:38:12 -0400
Subject: Re: [PATCH TRIVIAL v2] Avoid conflict with host definitions when
 cross-compiling
References: <1439549533-8716-1-git-send-email-p.fedin@samsung.com>
 <55D5BAA4.5050003@suse.com> <018a01d0db44$35ed5630$a1c80290$@samsung.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <55D5CA31.8090401@suse.com>
Date: Thu, 20 Aug 2015 14:38:09 +0200
MIME-Version: 1.0
In-Reply-To: <018a01d0db44$35ed5630$a1c80290$@samsung.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Pavel Fedin <p.fedin@samsung.com>
Cc: linux-kbuild@vger.kernel.org, trivial@kernel.org

On 2015-08-20 14:31, Pavel Fedin wrote:
>  Hello!
> 
>> Thanks, applied to kbuild.git#kbuild. But it seems that
>> arch/x86/tools/relocs needs the same fix.
> 
>  Perhaps. I tried to compile only ARM kernels, no x86.
> 
>  By the way, i have several more fixes which could increase kbuild portability. For example, there
> are several issues on Cygwin with .exe extensions of some tools. Could we upstream them also?

If you already have the patches, it won't hurt to send them. Although I
was under the impression that the .exe suffix is somehow automagically
handled by Cygwin..?

Michal

