Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:37307 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751491AbcELOWi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 May 2016 10:22:38 -0400
Subject: Re: [PATCH] deb-pkg: add the shared header file for arm64
References: <1463043837-4348-1-git-send-email-shijie.huang@arm.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <573491A2.7070809@suse.com>
Date: Thu, 12 May 2016 16:22:26 +0200
MIME-Version: 1.0
In-Reply-To: <1463043837-4348-1-git-send-email-shijie.huang@arm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Huang Shijie <shijie.huang@arm.com>
Cc: nd@arm.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, steve.capper@arm.com

On 2016-05-12 11:03, Huang Shijie wrote:
> The arch/arm/include/asm/opcodes.h is also used by the arm64.
> This patch copies it to the arm64 deb package.
> 
> Signed-off-by: Huang Shijie <shijie.huang@arm.com>
> ---
>  scripts/package/builddeb | 6 ++++++
>  1 file changed, 6 insertions(+)


Hi Huang,

this is fixed (admittedly in a more aggressive way) by 962475ac2f96
("builddeb: fix missing headers in linux-headers package") in linux-next.

Michal
