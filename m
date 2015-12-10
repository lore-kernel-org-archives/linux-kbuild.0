Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:58182 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753340AbbLJKID (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Dec 2015 05:08:03 -0500
Subject: Re: [PATCH] genksyms: Handle string literals with spaces in reference
 files
References: <1449673575-328-1-git-send-email-mmarek@suse.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <56694F00.9040100@suse.cz>
Date: Thu, 10 Dec 2015 11:08:00 +0100
MIME-Version: 1.0
In-Reply-To: <1449673575-328-1-git-send-email-mmarek@suse.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Dne 9.12.2015 v 16:06 Michal Marek napsal(a):
> The reference files use spaces to separate tokens, however, we must
> preserve spaces inside string literals. Currently the only case in the
> tree is struct edac_raw_error_desc in <linux/edac.h>:
> 
> $ KBUILD_SYMTYPES=1 make -s drivers/edac/amd64_edac.symtypes
> $ mv drivers/edac/amd64_edac.{symtypes,symref}
> $ KBUILD_SYMTYPES=1 make -s drivers/edac/amd64_edac.symtypes
> drivers/edac/amd64_edac.c:527: warning: amd64_get_dram_hole_info: modversion changed because of changes in struct edac_raw_error_desc
> 
> Signed-off-by: Michal Marek <mmarek@suse.com>

Applied to kbuild.git#kbuild.

Michal

