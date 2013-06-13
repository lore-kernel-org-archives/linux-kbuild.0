Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:57662 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752531Ab3FMOBV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 13 Jun 2013 10:01:21 -0400
Message-ID: <51B9D0AD.1060505@suse.cz>
Date: Thu, 13 Jun 2013 16:01:17 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH RESEND] Makefile.lib: align DTB quiet_cmd
References: <1371120789-18342-1-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1371120789-18342-1-git-send-email-james.hogan@imgtec.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: James Hogan <james.hogan@imgtec.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Dirk Brandewie <dirk.brandewie@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, trivial@kernel.org

On 13.6.2013 12:53, James Hogan wrote:
> The unaligned dtb.S filename in make output started to irritate me:
>   DTC     arch/metag/boot/dts/skeleton.dtb
>   DTB    arch/metag/boot/dts/skeleton.dtb.S
>   AS      arch/metag/boot/dts/skeleton.dtb.o
>   LD      arch/metag/boot/dts/built-in.o
> 
> Add an extra space to quiet_cmd_dt_S_dtb so the dtb.S filename aligns
> with all the others.

Applied to kbuild.git#kbuild.

Michal
