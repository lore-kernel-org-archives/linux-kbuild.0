Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:58116 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753013AbbLJKHe (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Dec 2015 05:07:34 -0500
Subject: Re: [RESEND PATCH] kconfig: allow kconfig to handle longer path names
References: <1449701772-25095-1-git-send-email-mmayer@broadcom.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <56694EE4.2040108@suse.com>
Date: Thu, 10 Dec 2015 11:07:32 +0100
MIME-Version: 1.0
In-Reply-To: <1449701772-25095-1-git-send-email-mmayer@broadcom.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Markus Mayer <mmayer@broadcom.com>
Cc: "Yann E. Morin" <yann.morin.1998@free.fr>, Sam Ravnborg <sam@ravnborg.org>, Linux Kbuild <linux-kbuild@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>

On 2015-12-09 23:56, Markus Mayer wrote:
> The current (arbitrary) limit of 128 characters for path names has
> proven too short for Android builds, as longer path names are used
> there.
> 
> Change conf.c, so it can handle path lengths up to PATH_MAX characters.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  scripts/kconfig/conf.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Thanks, applied to kbuild.git#kconfig.

Michal

