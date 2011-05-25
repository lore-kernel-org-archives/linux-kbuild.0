Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:52459 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750712Ab1EYKJq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 25 May 2011 06:09:46 -0400
Message-ID: <4DDCD569.2030306@suse.cz>
Date: Wed, 25 May 2011 12:09:45 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] kbuild: Fix reference to vermagic.h
References: <1306314599-19233-1-git-send-email-geert@linux-m68k.org>
In-Reply-To: <1306314599-19233-1-git-send-email-geert@linux-m68k.org>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 25.5.2011 11:09, Geert Uytterhoeven wrote:
> It's "include/linux/vermagic.h", not "include/vermagic.h"
>
> Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>
> ---
>   scripts/Makefile.modpost |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)

Applied to kbuild-2.6.git#kbuild, thanks.

Michal
