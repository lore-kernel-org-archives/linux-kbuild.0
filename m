Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:59132 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752137AbbHTLbv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Aug 2015 07:31:51 -0400
Subject: Re: [PATCH TRIVIAL v2] Avoid conflict with host definitions when
 cross-compiling
References: <1439549533-8716-1-git-send-email-p.fedin@samsung.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <55D5BAA4.5050003@suse.com>
Date: Thu, 20 Aug 2015 13:31:48 +0200
MIME-Version: 1.0
In-Reply-To: <1439549533-8716-1-git-send-email-p.fedin@samsung.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Pavel Fedin <p.fedin@samsung.com>
Cc: linux-kbuild@vger.kernel.org, trivial@kernel.org

On 2015-08-14 12:52, Pavel Fedin wrote:
> Certain platforms (e. g. BSD-based ones) define some ELF constants
> according to host. This patch fixes problems with cross-building
> Linux kernel on these platforms (e. g. building ARM 32-bit version
> on x86-64 host).
> 
> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>

Thanks, applied to kbuild.git#kbuild. But it seems that
arch/x86/tools/relocs needs the same fix.

Michal
